import sys
import threading
from PyQt5.QtCore import QState, QStateMachine, Qt, QObject
from PyQt5.QtWidgets import QApplication, QMainWindow, QGridLayout, QGroupBox, QHBoxLayout, QVBoxLayout, QSizePolicy, QPushButton, QLabel, QWidget

import pigpio

#######################################################################
#
# Define constants
#
#######################################################################

#######################################################################
#
# Names here correspond to labels on the schematic

# Relay control
main220 = "Main220"
vacuumpump = "VacuumPump"
heater = "Heater"
vacvalve = "Vac_Valve"
upvalve = "Up_Valve"
downforcevalve = "DownForce_Valve"
heaterforwardvalve = "HeaterForward_Valve"
blowoffvalve = "Blow_Off_Valve"
covermagnets = "Cover_Magnets"

# Status switches
tabledownsw = "TableDownSW"

#######################################################################
#
# Map the schematic names to GPIO pins.

digitalInputs = {
  tabledownsw: 5
}

digitalOutputs = {
  main220 : 19,
  vacuumpump : 27,
  heater : 13,
  vacvalve : 22,
  upvalve : 26,
  downforcevalve : 21,
  heaterforwardvalve : 20,
  blowoffvalve : 16,
  covermagnets : 12
}

#######################################################################
#
# The states of the above I/O are shown to the user on the status bar
# of the main window. This list describes how they are shown in the
# status bar. The items are organized roughly in the order they are
# expected to activate in normal operation.
# * First entry is the label to use in the status bar.
# * Second entry is the name of the input or output. When this is an
#   empty string, the first entry is just a label used to categorize 
#   the I/O that follows it. It has no direct mapping to an I/O port 
#   itself.

statusIO = (
  ("Power", ""),
  ("220V", main220),
  ("Vacuum", vacuumpump),
  ("Heater", ""),   # 'Heater' here is a category label.
  ("On", heater),
  ("Forward", heaterforwardvalve),
  ("Frame", ""),
  ("Up", upvalve),
  ("Magnet", covermagnets),
  ("Drop", tabledownsw),
  ("Down", downforcevalve),
  ("Table", ""),
  ("Vacuum", vacvalve),
  ("Air", blowoffvalve)
)

#######################################################################
#
# Style sheets

ioOnStyle = "* { font-size:18px; background-color : green; color : white }"
ioOffStyle = "* { font-size:18px; background-color : white; color : gray }"
stateStyle = "* { font:bold; font-size:24px }"
expandBtnStyle = "* { font-size:20px }"

#######################################################################
#
# Time-related constants

debounceWaitPeriod = 0.2 # Seconds to wait for GPIO level to settle.

#######################################################################
#
# Custom UI elements derived from standard Qt UI
#
#######################################################################

#######################################################################
#
# OnOffLabel class was designed to be used in the status bar to indicate
# state of machine components. It has an "On" and an "Off" state that
# uses the above styles to visually distinguish from each other.

class OnOffLabel(QLabel):
  
  currentOn = False
  
  def __init__(self, name, parent=None, initialOn = False):
    super().__init__(name, parent)
    if(initialOn):
      self.turnOn()
    else:
      self.turnOff()    
    
  def turnOn(self):
    self.currentOn = True
    self.setStyleSheet(ioOnStyle)
    
  def turnOff(self):
    self.currentOn = False
    self.setStyleSheet(ioOffStyle)

#######################################################################
#
# GPIOLabel is a label that changes its visual appearance (but maintain
# the same text label) corresponding to the state of its corresponding
# GPIO pin.

class GPIOLabel(QLabel):

  def __init__(self, name, gpioControl, pin, parent=None):
    super().__init__(name, parent)
    self.gpioControl = gpioControl
    self.gpioPin = pin
    self.pinState = self.gpioControl.read(self.gpioPin)
    self.debounceWaiting = False
    gpioControl.callback(pin, pigpio.EITHER_EDGE, self.levelChangeCallback)

  def levelChangeCallback(self, gpio, level, tick):
    if gpio == self.gpioPin:
      if not self.debounceWaiting:
        self.debounceWaiting = True
        threading.Timer(debounceWaitPeriod, self.propagateLevelChange).start()

  def propagateLevelChange(self):
    currentState = self.gpioControl.read(self.gpioPin)
    if currentState != self.pinState:
      self.pinState = currentState
      print("Level changed on pin " + str(self.gpioPin) + " to " + str(currentState))
    self.debounceWaiting = False

#######################################################################
#
# StateLabel is used at the top of the screen to indicate the current
# state of the control

class StateLabel(QLabel):
  def __init__(self, name, parent=None):
    super().__init__(name.upper(), parent)
    self.setAlignment(Qt.AlignCenter)
    self.setStyleSheet(stateStyle)

#######################################################################
#
# Default QPushButton expands horizontally to fill available space but
# only take up as much vertical space as it needs for the enclosed label.
# This derived class expands to fill both horizontally and vertically.

class ExpandButton(QPushButton):
  def __init__(self, text, parent=None):
    super().__init__(text, parent)
    self.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)
    self.setStyleSheet(expandBtnStyle)

#######################################################################
#
# This button is modified to have an on/off state (checked true/false)
# that is toggled on each press.

class ExpandToggleButton(ExpandButton):
  def __init__(self, text, name, parent=None):
    super().__init__(text, parent)
    self.setCheckable(True)
    self.updateCheckedStyle()
    self.pinName = name

  def updateCheckedStyle(self):
    if self.isChecked():
      self.setStyleSheet(ioOnStyle)
    else:
      self.setStyleSheet(ioOffStyle)

  def nextCheckState(self):
    super().nextCheckState()
    self.updateCheckedStyle()

#######################################################################
#
# The top navigation bar consists of a grid layout with four equal-
# sized positions.
#  Leftmost: (Column 0) should be a button that takes user "back"
#  Rightmost:(Column 3) should be a button that takes user "forward"
#  Middle two (Column 1 and 2) can vary depending on state.
#
# TODO: is this better accomplished with a QToolbar?

class NavBar(QGridLayout):
  def __init__(self, parent=None):
    super().__init__(parent)
    self.setColumnStretch(0, 1)
    self.setColumnStretch(1, 1)
    self.setColumnStretch(2, 1)
    self.setColumnStretch(3, 1)

  def addNav(self, navItem, column):
    self.addWidget(navItem, 0, column)

#######################################################################
#
# StateUI is the template for a QWidget that holds all the UI for a state

class StateUI(QWidget):
  def __init__(self, navbar, label, controls, parent=None):
    super().__init__(parent)
    vbox = QVBoxLayout()
    vbox.insertLayout(-1, navbar, stretch=2)
    vbox.addWidget(StateLabel(label), stretch=1)
    vbox.insertLayout(-1, controls, stretch=9)
    self.setLayout(vbox)

#######################################################################
#
# PlaceholderLayout is a grid layout with a single QLabel with the given
# text. (Text-wrapping is activated.)

class PlaceholderLayout(QGridLayout):
  def __init__(self, label, parent=None):
    super().__init__(parent)
    l = QLabel(label)
    l.setWordWrap(True)
    self.addWidget(l)

#######################################################################
#
# Application UI
#
#######################################################################
    
#######################################################################
#
# Main Window class is the master of all UI on screen.

class MainWindow(QMainWindow):

  # Initialization
  def __init__(self, gpioControl, parent=None):
    super().__init__(parent)
    self.createStatusIO(gpioControl)
    self.setGeometry(0, 0, 800, 480)
    self.setWindowTitle("Tux Lab Thermoforming Control")
    self.show() # Will need to be showFullScreen() on the Pi touchscreen.

  # Walks through the statusIO list and create either an OnOffLabel
  # (For those with an I/O label) or a normal QLabel (For those without.)
  def createStatusIO(self, gpioControl):
    self.ioLabels = dict()
    
    for sio in statusIO:
      if sio[1] == "":
        self.statusBar().addPermanentWidget(QLabel(sio[0]))
      else:
        if sio[1] in digitalInputs:
          ioLabel = GPIOLabel(sio[0], gpioControl, digitalInputs[sio[1]])
        else:
          ioLabel = OnOffLabel(sio[0], initialOn = False)
        self.ioLabels[sio[1]] = ioLabel
        self.statusBar().addPermanentWidget(ioLabel)
    
  # Find a particular OnOffLabel with the given name
  def findOnOffLabel(self, labelName):
    if labelName in self.ioLabels:
      return self.ioLabels[labelName]    

#######################################################################
#
# I/O Management
#
#######################################################################

class IOManager(QObject):

  def __init__(self, uiOwner, gpioControl, parent=None):
    super().__init__(parent)
    self.uiOwner = uiOwner
    self.pi = gpioControl
    if not self.pi.connected:
      print("Pi I/O is not connected")
    for pin in digitalInputs.values():
      self.pi.set_mode(pin, pigpio.INPUT)
    for pin in digitalOutputs.values():
      self.pi.set_mode(pin, pigpio.OUTPUT)
    self.outputReset()

  def prepExit(self):
    self.pi.stop()

  def outputReset(self):
    for doName in digitalOutputs.keys():
      self.turnOff(doName)

  def expandToggleChanged(self, event):
    expandToggle = self.sender()
    name = expandToggle.pinName
    if event:
      self.turnOn(name)
    else:
      self.turnOff(name)

  def turnOn(self, name):
    gpio = digitalOutputs[name]
    self.pi.write(gpio, 1)
    statusText = self.uiOwner.findOnOffLabel(name)
    statusText.turnOn()

  def turnOff(self, name):
    gpio = digitalOutputs[name]
    self.pi.write(gpio, 0)
    statusText = self.uiOwner.findOnOffLabel(name)
    statusText.turnOff()

#######################################################################
#
# Application States & State Machine
#
#######################################################################

#######################################################################
#
# MachineState is the base class for all states in this machine.
class MachineState(QState):
  def __init__(self, uiWindow, ioManager, parent=None):
    super().__init__(parent)
    self.uiWindow = uiWindow
    self.ioManager = ioManager
    self.setupUI()

  def setupUI(self):
    self.ui = QLabel("Default MachineState UI needs to be overridden")

  def onEntry(self, event):
    self.uiWindow.setCentralWidget(self.ui)

  def onExit(self, event):
    # Reclaim the 'self.ui' object so uiWindow doesn't delete it
    self.uiWindow.takeCentralWidget()
    
#######################################################################
#
# StandByState is the initial start-up state

class StandbyState(MachineState):

  # Set up the UI to be shown for this state
  def setupUI(self):
    self.btnDC = ExpandButton("< Direct Control")
    self.btnActivate = ExpandButton("Activate >")
    
    navBar = NavBar()
    navBar.addNav(self.btnDC, 0)
    navBar.addNav(self.btnActivate, 3)

    standbyMenu = QGridLayout()
    standbyMenu.addWidget(ExpandButton("TODO: Hold to shut down"))
    
    self.ui = StateUI(navBar, "standby", standbyMenu)

  def onEntry(self, e):
    super().onEntry(e)
    self.ioManager.outputReset()

  # Called by state machine to connect transitions
  def toDirectControl(self, directControl):
    self.addTransition(self.btnDC.clicked, directControl)
    
  def toActivate(self, activeState):
    self.addTransition(self.btnActivate.clicked, activeState)

#######################################################################
#
# DirectControlState allows direct access to outputs

class DirectControlState(MachineState):

  # Set up the UI to be shown for this state
  def setupUI(self):
    self.btnSB = ExpandButton("Standby >")
    navBar = NavBar()
    navBar.addNav(self.btnSB, 3)
    
    controlMenu = QHBoxLayout()
    for sio in statusIO:
      if sio[1] == "":
        groupBox = QGroupBox(sio[0])
        groupBoxLayout = QVBoxLayout()
        groupBox.setLayout(groupBoxLayout)
        controlMenu.addWidget(groupBox)
      elif sio[1] in digitalOutputs:
        btn = ExpandToggleButton(sio[0], sio[1])
        btn.clicked.connect(self.ioManager.expandToggleChanged)
        groupBoxLayout.addWidget(btn)
      elif sio[1] in digitalInputs:
        continue
      else:
        print("Warning: Extraneous element in statusIO. Was there a misspelling? " + sio[1])
    
    self.ui = StateUI(navBar, "direct control", controlMenu)
    
  def toStandby(self, standby):
    self.addTransition(self.btnSB.clicked, standby)

#######################################################################
#
# ActiveState turns all the main components on in preparation for loading

class ActiveState(MachineState):
  def setupUI(self):
    self.btnStandby = ExpandButton("< Standby")
    self.btnLoading = ExpandButton("Load >")
    navBar = NavBar()
    navBar.addNav(self.btnStandby, 0)
    navBar.addNav(self.btnLoading, 3)
    
    activeMenu = PlaceholderLayout("TODO: Turn on main, wait 2s, turn on vacuum, wait 2s, turn on heater. Leave 'Loading' button inactive until sequence is complete.")
    
    self.ui = StateUI(navBar, "active", activeMenu)
    
  def toStandby(self, standby):
    self.addTransition(self.btnStandby.clicked, standby)

  def toLoading(self, loading):
    self.addTransition(self.btnLoading.clicked, loading)
    
  def onEntry(self, event):
    super().onEntry(event)
    self.ioManager.turnOn(main220)
    # TODO: wait 2 seconds
    self.ioManager.turnOn(vacuumpump)
    # TODO: wait 2 seconds
    self.ioManager.turnOn(heater)

#######################################################################
#
# Loading state raises the frame so operator can load work material

class LoadingState(MachineState):
  def setupUI(self):
    self.btnActive = ExpandButton("< Active")
    self.btnHeating = ExpandButton("Heat >")
    navBar = NavBar()
    navBar.addNav(self.btnActive, 0)
    navBar.addNav(self.btnHeating, 3)

    loadingMenu = PlaceholderLayout("TODO: (1) Button to start auto-cycle. (2) Button to allow operator to raise/lower the frame as needed. (3) Button to turn magnet on/off (4) Deactivate forward progress until heater is up to temperature")

    self.ui = StateUI(navBar, "loading", loadingMenu)

  def toActivate(self, activate):
    self.addTransition(self.btnActive.clicked, activate)

  def toHeating(self, heating):
    self.addTransition(self.btnHeating.clicked, heating)

  def onEntry(self, event):
    super().onEntry(event)
    self.ioManager.turnOn(heater)
    self.ioManager.turnOn(upvalve)
    self.ioManager.turnOn(covermagnets)

  def onExit(self, e):
    super().onExit(e)
    if e.sender() == self.btnActive:
      self.ioManager.turnOff(upvalve)
      self.ioManager.turnOff(covermagnets)

#######################################################################
#
# Heating state holds the workpiece up to the heater

class HeatingState(MachineState):
  def setupUI(self):
    self.btnLoading = ExpandButton("< Load")
    self.btnDrop = ExpandButton("Drop >")
    navBar = NavBar()
    navBar.addNav(self.btnLoading, 0)
    navBar.addNav(self.btnDrop, 3)

    heatingMenu = PlaceholderLayout("TODO: Timer counts up on heating duration. Show time threshold parameter for auto operation. Option to turn off auto operation")

    self.ui = StateUI(navBar, "heating", heatingMenu)

  def toLoading(self, loading):
    self.addTransition(self.btnLoading.clicked, loading)

  def toDrop(self, drop):
    self.addTransition(self.btnDrop.clicked, drop)

  def onEntry(self, e):
    super().onEntry(e)
    self.ioManager.turnOn(heaterforwardvalve)

  def onExit(self, e):
    super().onExit(e)
    self.ioManager.turnOff(heaterforwardvalve)

#######################################################################
#
# Drop state waits for the frame to drop to the table

class DropState(MachineState):
  def setupUI(self):
    self.btnHeating = ExpandButton("< Heat")
    self.btnForming = ExpandButton("Form >")
    navBar = NavBar()
    navBar.addNav(self.btnHeating, 0)
    navBar.addNav(self.btnForming, 3)

    dropMenu = PlaceholderLayout("TODO: Button to active downforce instead of waiting. Timer to count how long we've waited for drop. Disable forward progress until frame down switch is closed.")

    self.ui = StateUI(navBar, "dropping", dropMenu)

  def toHeating(self, heating):
    self.addTransition(self.btnHeating.clicked, heating)

  def toForming(self, forming):
    self.addTransition(self.btnForming.clicked, forming)

  def onEntry(self, e):
    super().onEntry(e)
    self.ioManager.turnOff(heater)
    self.ioManager.turnOff(upvalve)

  def onExit(self, e):
    super().onExit(e)
    if e.sender() == self.btnHeating:
      self.ioManager.turnOn(heater)
      self.ioManager.turnOn(upvalve)

#######################################################################
#
# Forming state applies vacuum to pull workpiece against mold

class FormingState(MachineState):
  def setupUI(self):
    self.btnComplete = ExpandButton("Complete >")
    navBar = NavBar()
    navBar.addNav(self.btnComplete, 3)

    formingMenu = PlaceholderLayout("TODO: Timer to count how long we've been forming. Show timer threshold for auto cycle. Option to disable auto cycle.")

    self.ui = StateUI(navBar, "forming", formingMenu)

  def toComplete(self, complete):
    self.addTransition(self.btnComplete.clicked, complete)

  def onEntry(self, e):
    super().onEntry(e)
    self.ioManager.turnOn(downforcevalve)
    self.ioManager.turnOn(vacvalve)

  def onExit(self, e):
    super().onExit(e)
    self.ioManager.turnOff(downforcevalve)
    self.ioManager.turnOff(vacvalve)

#######################################################################
#
# Forming operating complete, operator can remove workpiece.

class CompleteState(MachineState):
  def setupUI(self):
    self.btnStandby = ExpandButton("< Standby")
    self.btnLoading = ExpandButton("Load >")
    navBar = NavBar()
    navBar.addNav(self.btnStandby, 0)
    navBar.addNav(self.btnLoading, 3)

    self.btnMagnet = ExpandToggleButton("Magnets", covermagnets)
    self.btnMagnet.setChecked(True)
    self.btnMagnet.updateCheckedStyle()
    self.btnMagnet.clicked.connect(self.ioManager.expandToggleChanged)

    self.btnBlowoff = ExpandToggleButton("Blowoff", blowoffvalve)
    self.btnBlowoff.setChecked(False)
    self.btnBlowoff.clicked.connect(self.ioManager.expandToggleChanged)

    completeMenu = QHBoxLayout()
    completeMenu.addWidget(self.btnMagnet, 1)
    completeMenu.addWidget(self.btnBlowoff, 1)

    self.ui = StateUI(navBar, "complete", completeMenu)

  def onEntry(self, e):
    super().onEntry(e)
    self.btnMagnet.setChecked(True) # TODO: Can this be read from IOManager?
    self.btnMagnet.updateCheckedStyle()

  def toStandby(self, standby):
    self.addTransition(self.btnStandby.clicked, standby)

  def toLoading(self, loading):
    self.addTransition(self.btnLoading.clicked, loading)

#######################################################################
#
# Main state machine of the thermoformer control

class StateMachine(QStateMachine):
  def __init__(self, window, ioManager, parent=None):
    super().__init__(parent)
    self.mainWindow = window
    self.ioManager = ioManager
    
    standby = StandbyState(window, ioManager)
    directControl = DirectControlState(window, ioManager)
    active = ActiveState(window, ioManager)
    loading = LoadingState(window, ioManager)
    heating = HeatingState(window, ioManager)
    dropping = DropState(window, ioManager)
    forming = FormingState(window, ioManager)
    complete = CompleteState(window, ioManager)
    
    directControl.toStandby(standby)
    standby.toDirectControl(directControl)
    standby.toActivate(active)
    active.toStandby(standby)
    active.toLoading(loading)
    loading.toActivate(active)
    loading.toHeating(heating)
    heating.toLoading(loading)
    heating.toDrop(dropping)
    dropping.toHeating(heating)
    dropping.toForming(forming)
    forming.toComplete(complete)
    complete.toStandby(standby)
    complete.toLoading(loading)

    self.addState(directControl)
    self.addState(standby)
    self.addState(active)
    self.addState(loading)
    self.addState(heating)
    self.addState(dropping)
    self.addState(forming)
    self.addState(complete)
    
    self.setInitialState(standby)

#######################################################################
#
# Main
#
#######################################################################

#######################################################################
#
# main function

def main():
  global app
  app = QApplication(sys.argv)
  
  gpioControl = pigpio.pi() # ioManager will be responsible for shutdown
  mainWindow = MainWindow(gpioControl)
  ioManager = IOManager(mainWindow,gpioControl)
  
  stateMachine = StateMachine(mainWindow, ioManager)
  stateMachine.start()
  
  app.aboutToQuit.connect(ioManager.prepExit)
  sys.exit(app.exec_())

if __name__ == '__main__':
  main()
