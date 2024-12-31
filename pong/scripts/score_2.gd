extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_ball_score_signal(playerpt: String) -> void:
		if playerpt == $".".name:
			text = str(int(text) + 1)
