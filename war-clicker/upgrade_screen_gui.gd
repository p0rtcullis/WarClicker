extends Control

var active_upgrades = []

@onready var all_upgrades = [%UpgradeMaxWorkersButton1, %UpgradeMaxWorkersButton2]
@onready var upgrades_with_prereqs = [%UpgradeMaxWorkersButton2]
@onready var upgrade_max_workers_button_2_prereq = [%UpgradeMaxWorkersButton1]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disable_advanced_tech()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_reset_upgrades_button_pressed() -> void:
	for upgrade in active_upgrades:
		upgrade.button_pressed = false
	active_upgrades.clear()
	disable_advanced_tech()
	

func disable_advanced_tech():
	for upgrade in upgrades_with_prereqs:
		upgrade.disabled = true

func check_advanced_tech(unlocked,prereq):
	print(unlocked)
	print(prereq)
	var all_unlocked = prereq.all(func(item): return item in unlocked)
	print(all_unlocked)
	if all_unlocked:
		return true
	else:
		return false


func _on_upgrade_max_workers_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%ManagementScreen.update_max_workers(1)
		%UpgradeMaxWorkersButton1.disabled = true
		active_upgrades.append(%UpgradeMaxWorkersButton1)
		if check_advanced_tech(active_upgrades,upgrade_max_workers_button_2_prereq):
			%UpgradeMaxWorkersButton2.disabled = false
	else :
		%ManagementScreen.update_max_workers(-1)
		%UpgradeMaxWorkersButton1.disabled = false
		

func _on_upgrade_max_workers_button_2_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%ManagementScreen.update_max_workers(2)
		%UpgradeMaxWorkersButton2.disabled = true
		active_upgrades.append(%UpgradeMaxWorkersButton2)
	else :
		%ManagementScreen.update_max_workers(-2)
		%UpgradeMaxWorkersButton2.disabled = false


func _on_costly_upgrade_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		if %ManagementScreen.max_workers > 3:
			print("Good")
		else:
			print("Bad")
			%CostlyUpgradeButton1.button_pressed = false
