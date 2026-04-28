extends Control

@onready var last_screen = %ProductionScreenGUI

func _on_production_screen_toggle_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%UpgradeScreenGUI.hide()
		%CombatScreenGUI.hide()
		%ProductionScreenGUI.show()
		last_screen = %ProductionScreenGUI
	else:
		%ProductionScreenGUI.hide()
		last_screen.show()



func _on_upgrade_screeen_toggle_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%UpgradeScreenGUI.show()
		%CombatScreenGUI.hide()
		%ProductionScreenGUI.hide()
		last_screen = %UpgradeScreenGUI
	else:
		%UpgradeScreenGUI.hide()
		last_screen.show()
