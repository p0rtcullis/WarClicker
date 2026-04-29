extends Control

@onready var selected_worker

var guard_production_queue : Array = []
var spider_production_queue : Array = []




func _on_guard_prodction_button_pressed() -> void:
	selected_worker = %Guard
	
func _on_spider_production_button_pressed() -> void:
	selected_worker = %Spider



func _on_shooter_production_button_pressed() -> void:
	print(selected_worker.stats.worker_name)
