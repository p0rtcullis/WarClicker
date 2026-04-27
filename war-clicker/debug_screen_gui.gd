extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_toggle_guard_toggled(toggled_on: bool) -> void:
	if %Guard.stats.unlocked == false:
		%Guard.stats.unlocked = true
	else:
		%Guard.stats.unlocked = false
