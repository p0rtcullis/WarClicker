extends Control

var trigger_turns : Array = [2,5,8,10]
	
func _ready():
	Events.connect("trigger_event",_on_event_triggered)
	

func _on_event_triggered():
	print("event triggered")
