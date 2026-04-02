extends Node

var guard_template = preload("res://Worker/guard.tscn")

var max_workers = 3:
	set(value):
		max_workers = value
		%MaxWorkersLabel.text = "Max Workers: " +str(value)
		#print("Current Workers: " + str(max_workers))
var worker_list : Array = []

var total_green : int = 0
var green_mod : int = 0

var total_brown : int = 0
var brown_mod : int = 0

var total_magenta : int = 0
var magenta_mod : int = 0

var total_purple : int = 0
var purple_mod : int = 0

enum Workers {GUARD}
enum POINTS {GREEN}


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#create_worker(Worker.GUARD)
	%MaxWorkersLabel.text = "Max Workers: " +str(max_workers)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func create_worker(current_worker: Workers):
	match current_worker:
		Workers.GUARD:
			var guard = guard_template.instantiate()
			add_child(guard)
			worker_list.append(guard)

func point_count(color : POINTS):
	var point_total : int = 0
	for worker in worker_list:
		match color:
			POINTS.GREEN:
				point_total += worker.stats.green
	return point_total
	


func _on_add_guard_button_pressed() -> void:
	if worker_list.size() < max_workers:
		create_worker(Workers.GUARD)
	else:
		print("Too many workers!")
		print(worker_list.size())


func _on_update_timer_timeout() -> void:
	total_green += point_count(POINTS.GREEN)
	%GreenPointsLabel.text = str(total_green)

func update_max_workers(new_max: int):
	max_workers += new_max
