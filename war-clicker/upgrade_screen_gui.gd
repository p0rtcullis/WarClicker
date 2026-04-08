extends Control

#Every time points update, go through every NON-PURCHASED upgrade.
#Take an array of purchased upgrades, compare to all upgrades, return unpurchased
#For each unpurchased, check against points, disable the button.

#also, refactor button as object with resource

var active_upgrades = []

@onready var all_upgrades = [%UpgradeMaxWorkers1]
@onready var upgrades_with_prereqs = []
@onready var upgrade_max_workers_button_2_prereq = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#disable_advanced_tech()
	#print(%UpgradeButton.stats.green_cost)
	#%UpgradeButton.disabled = true
	#for upgrade in all_upgrades:
		#upgrade.disabled = true
		#upgrade.text = upgrade.stats.upgrade_name
	pass
	
func price_check(upgrade_cost,total_points):
	return upgrade_cost <= total_points


func _on_reset_upgrades_button_pressed() -> void:
	for upgrade in active_upgrades:
		upgrade.button_pressed = false
	active_upgrades.clear()
	disable_advanced_tech()
	
func disable_unafforable_techs():
	var cost_count = 0
	var cost_check = 4
	for x in all_upgrades:
		for y in range(4):
			var all_costs = [x.stats.green_cost,x.stats.brown_cost,x.stats.magenta_cost,x.stats.purple_cost]
			var all_points = [%ManagementScreen.total_green,%ManagementScreen.total_brown,%ManagementScreen.total_magenta,%ManagementScreen.total_purple]
			if price_check(all_costs[y],all_points[y]):
					cost_count +=1
		if cost_count < cost_check:
			x.disabled = true
		else:
			x.disabled = false
					
func disable_advanced_tech():
	pass

		
func _on_upgrade_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		if %ManagementScreen.max_workers > 3:
			print(%UpgradeButton.stats.upgrade_name)
		else:
			print("Bad")
			%CostlyUpgradeButton1.button_pressed = false


func _on_upgrade_max_workers_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%ManagementScreen.update_points(-100,%ManagementScreen.POINTS.GREEN)
		%ManagementScreen.update_max_workers(1)
		active_upgrades.append(%UpgradeMaxWorkers1)
		%UpgradeMaxWorkers1.disabled = true
	else:
		%ManagementScreen.update_points(100,%ManagementScreen.POINTS.GREEN)
		%ManagementScreen.update_max_workers(-1)
		%UpgradeMaxWorkers1.disabled = false
		
