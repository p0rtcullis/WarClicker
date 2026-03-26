extends Control

var active_upgrades = []

#var max_worker_upgrade : bool = false:
	#set(value):
		#if value == true:
			#active_upgrades.append(%UpgradeMaxWorkersButton1)
			#print(active_upgrades)
		#else:
			#active_upgrades.remove(%UpgradeMaxWorkersButton1)
			#%ManagementScreen.max_workers -=1
			#%UpgradeMaxWorkersButton1.disabled = false
			#print(active_upgrades)
			
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_reset_upgrades_button_pressed() -> void:
	#active_upgrades.remove(%UpgradeMaxWorkersButton1)
	for upgrade in active_upgrades:
		upgrade.button_pressed = false
	active_upgrades.clear()


func _on_upgrade_max_workers_button_1_toggled(toggled_on: bool) -> void:
	if toggled_on:
		%ManagementScreen.update_max_workers(1)
		%UpgradeMaxWorkersButton1.disabled = true
		active_upgrades.append(%UpgradeMaxWorkersButton1)
	else :
		%ManagementScreen.update_max_workers(-1)
		%UpgradeMaxWorkersButton1.disabled = false
		
