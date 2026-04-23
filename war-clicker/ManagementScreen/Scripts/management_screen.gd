extends Node

var guard_template = preload("res://Worker/guard.tscn")

var max_workers = 3:
	set(value):
		max_workers = value
		%MaxWorkersLabel.text = "Max Workers: " +str(value)
var worker_list : Array = []

var unit_list : Array = []

@export var total_green : int = 0:
	set(value):
		total_green = value
		%GreenPointsLabel.text = str(total_green)
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var green_mod : int = 0

var total_brown : int = 0:
	set(value):
		total_brown = value
		%BrownPointsLabel.text = str(total_brown)
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var brown_mod : int = 0

var total_magenta : int = 0:
	set(value):
		total_magenta = value
		%MagentaPointsLabel.text = str(total_magenta)
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var magenta_mod : int = 0

var total_purple : int = 0:
	set(value):
		total_purple = value
		%GreenPointsLabel.text = str(total_purple)
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var purple_mod : int = 0

#chance to produce a unit
var guard_production_chance : int = 0
#number of units produced per worker
var guard_production_eff : int = 0

enum WORKERS {GUARD,REAPER,BANSHEE,SPIDER,DRAGON,AUTARCH,WARLOCK,SPIRITSEER,AVENGER,HAWK,SCORPION}
enum POINTS {GREEN,BROWN,MAGENTA,PURPLE}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#create_worker(Worker.GUARD)
	%MaxWorkersLabel.text = "Max Workers: " +str(max_workers)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_worker(current_worker: WORKERS):
	match current_worker:
		WORKERS.GUARD:
			var guard = guard_template.instantiate()
			add_child(guard)
			worker_list.append(guard)

func point_count(color : POINTS):
	var point_total : int = 0
	for worker in worker_list:
		match color:
			POINTS.GREEN:
				point_total += worker.stats.green
			POINTS.BROWN:
				point_total += worker.stats.brown
			POINTS.MAGENTA:
				point_total += worker.stats.magenta
			POINTS.PURPLE:
				point_total += worker.stats.purple
	return point_total
	


func _on_add_guard_button_pressed() -> void:
	if worker_list.size() < max_workers:
		create_worker(WORKERS.GUARD)


#func _on_update_timer_timeout() -> void:
	#total_green += point_count(POINTS.GREEN)

func update_max_workers(new_max: int):
	max_workers += new_max
	
func update_points(new_points: int, color : WORKERS):
	match color:
			POINTS.GREEN:
				total_green += new_points
			POINTS.BROWN:
				total_brown += new_points
			POINTS.MAGENTA:
				total_magenta += new_points
			POINTS.PURPLE:
				total_purple += new_points
				
	
