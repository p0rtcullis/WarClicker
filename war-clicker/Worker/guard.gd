extends Node2D

@export var stats : Resource
@export var producing : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_production_timer_timeout() -> void:
	producing = false
	%ManagementScreen.append(1)
