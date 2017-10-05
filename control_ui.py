import sys
from PyQt5.QtCore import QState, QStateMachine
from PyQt5.QtWidgets import QApplication, QMainWindow, QGridLayout, QHBoxLayout, QVBoxLayout, QSizePolicy, QPushButton, QLabel, QWidget

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
  tabledownsw: 27
}

digitalOutputs = {
  main220 : 5,
  vacuumpump : 6,
  heater : 13,
  vacvalve : 19,
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
# Styling used to denote state of above I/O when displayed to user

ioOnStyle = "* {background-color : green; color : white}"
ioOffStyle = "* {background-color : white; color : gray}"

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
# Default QPushButton expands horizontally to fill available space but
# only take up as much vertical space as it needs for the enclosed label.
# This derived class expands to fill both horizontally and vertically.

class ExpandButton(QPushButton):
  def __init__(self, text, parent=None):
    super().__init__(text, parent)
    self.setSizePolicy(QSizePolicy.Expanding, QSizePolicy.Expanding)

#######################################################################
#
# This button is modified to have an on/off state (checked true/false)
# that is toggled on each press.

class ExpandToggleButton(ExpandButton):
  def __init__(self, text, parent=None):
    super().__init__(text, parent)
    self.setCheckable(True)
    self.updateCheckedStyle()

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
# Application UI
#
#######################################################################
    
#######################################################################
#
# Main Window class is the master of all UI on screen.

class MainWindow(QMainWindow):

  # Initialization
  def __init__(self):
    super().__init__()
    self.createStatusIO()
    self.setGeometry(0, 0, 800, 480)
    self.setWindowTitle("Tux Lab Thermoforming Control")
    self.show() # Will need to be showFullScreen() on the Pi touchscreen.

  # Walks through the statusIO list and create either an OnOffLabel
  # (For those with an I/O label) or a normal QLabel (For those without.)
  def createStatusIO(self):
    self.ioLabels = dict()
    
    for sio in statusIO:
      if sio[1] == "":
        self.statusBar().addPermanentWidget(QLabel(sio[0]))
      else:
        ioLabel = OnOffLabel(sio[0], initialOn = (sio[1] == "TableDownSW")) # TableDownSW is a hack until I get real input
        self.ioLabels[sio[1]] = ioLabel
        self.statusBar().addPermanentWidget(ioLabel)
    
  # Find a particular OnOffLabel with the given name
  def findOnOffLabel(self, labelName):
    if labelName in self.ioLabels:
      return self.ioLabels[labelName]    

#######################################################################
#
# Application States & State Machine
#
#######################################################################

#######################################################################
#
# StandByState is the initial start-up state

class StandbyState(QState):
  def __init__(self, uiWindow, parent=None):
    super().__init__(parent)
    self.uiWindow = uiWindow
    self.setupUI()
    
  # Set up the UI to be shown for this state
  def setupUI(self):
    self.ui = QWidget()
    label = QLabel("Standby")
    self.btnDC = QPushButton("Direct Control", self.ui)
    self.btnDC.flat = True
    
    vbox = QVBoxLayout()
    vbox.addWidget(label)
    vbox.addWidget(self.btnDC)
    self.ui.setLayout(vbox)

  def onEntry(self, event):
    self.uiWindow.setCentralWidget(self.ui)
    
  def onExit(self, event):
    # Reclaim the 'self.ui' object so uiWindow doesn't delete it
    self.uiWindow.takeCentralWidget()

  # Called by state machine to connect transitions
  def toDirectControl(self, directControl):
    self.addTransition(self.btnDC.clicked, directControl)

#######################################################################
#
# DirectControlState allows direct access to outputs

class DirectControlState(QState):
  def __init__(self, uiWindow, parent=None):
    super().__init__(parent) 
    self.uiWindow = uiWindow
    self.setupUI()

  # Set up the UI to be shown for this state
  def setupUI(self):
    self.ui = QWidget()
    label = QLabel("Direct Control")
    
    gridbox = QGridLayout()
    gridbox.addWidget(ExpandToggleButton("Main"), 0, 0)
    gridbox.addWidget(ExpandToggleButton("Vac"), 0, 1)
    gridbox.addWidget(ExpandToggleButton("Heat"), 0, 2)
    gridbox.addWidget(ExpandToggleButton("Fwd"),  1, 0)
    gridbox.addWidget(ExpandToggleButton("Up"), 1, 1)
    gridbox.addWidget(ExpandToggleButton("Down"), 1, 2)
    gridbox.addWidget(ExpandToggleButton("Suck"), 2, 0)
    gridbox.addWidget(ExpandToggleButton("Blow"), 2, 1)
    gridbox.addWidget(ExpandToggleButton("Magnets"), 2, 2)
    
    self.btnSB = ExpandButton("Standby", self.ui)
    
    vbox = QVBoxLayout()
    vbox.addWidget(label, stretch=1)
    vbox.insertLayout(-1, gridbox, stretch=9)
    vbox.addWidget(self.btnSB, stretch=2)
    self.ui.setLayout(vbox)
    
  def onEntry(self, event):
    self.uiWindow.setCentralWidget(self.ui)

  def onExit(self, event):
    # Reclaim the 'self.ui' object so uiWindow doesn't delete it
    self.uiWindow.takeCentralWidget()
    
  def toStandby(self, standby):
    self.addTransition(self.btnSB.clicked, standby)

#######################################################################
#
# Main state machine of the thermoformer control

class StateMachine(QStateMachine):
  def __init__(self, window, parent=None):
    super().__init__(parent)
    self.mainWindow = window
    
    standby = StandbyState(window)    
    
    directControl = DirectControlState(window)
    
    standby.toDirectControl(directControl)
    directControl.toStandby(standby)

    self.addState(directControl)
    self.addState(standby)
    
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
  
  mainWindow = MainWindow()
  
  stateMachine = StateMachine(window=mainWindow)
  stateMachine.start()
  
  sys.exit(app.exec_())

if __name__ == '__main__':
  main()
