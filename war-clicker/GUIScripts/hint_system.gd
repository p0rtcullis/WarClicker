extends Control

var hint_count : int = 0

func _on_hint_timer_timeout() -> void:
	if %HintBox.visible:
		
		%HintBox.hide()
	else:
		%HintBox.show()
		
