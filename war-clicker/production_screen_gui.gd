extends Control

@onready var shooter_template = preload("res://Unit/shooter_unit.tscn")
@onready var stabber_template = preload("res://Unit/stabber_unit.tscn")

@onready var selected_worker = %Guard

var guard_production_queue : Array = []
var spider_production_queue : Array = []




func _on_guard_prodction_button_pressed() -> void:
	selected_worker = %Guard
	
func _on_spider_production_button_pressed() -> void:
	selected_worker = %Spider



func _on_shooter_production_button_pressed() -> void:
	var unit = shooter_template.instantiate()
	selected_worker.production_queue.append(unit)
	print(selected_worker.production_queue)
