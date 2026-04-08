extends Node

var guard_template = preload("res://Worker/guard.tscn")

var max_workers = 3:
	set(value):
		max_workers = value
		%MaxWorkersLabel.text = "Max Workers: " +str(value)
		#print("Current Workers: " + str(max_workers))
var worker_list : Array = []

@export var total_green : int = 0:
	set(value):
		total_green = value
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var green_mod : int = 0

var total_brown : int = 0:
	set(value):
		total_brown = value
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var brown_mod : int = 0

var total_magenta : int = 0:
	set(value):
		total_magenta = value
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var magenta_mod : int = 0

var total_purple : int = 0:
	set(value):
		total_purple = value
		%UpgradeScreenGUI.disable_unafforable_techs()
		
var purple_mod : int = 0



enum WORKERS {GUARD}
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
	else:
		print("Too many workers!")
		print(worker_list.size())


func _on_update_timer_timeout() -> void:
	total_green += point_count(POINTS.GREEN)
	%GreenPointsLabel.text = str(total_green)

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
				
	
