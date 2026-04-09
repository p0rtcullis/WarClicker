extends Button

@export var stats : Resource
@export var prereq : Array[Button] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	disabled = true
	text = stats.upgrade_name
	tooltip_text = stats.upgrade_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
