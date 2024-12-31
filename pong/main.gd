extends Node
var ballCreate = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_ball_spawn_timer_timeout() -> void:
	$BallSpawnTimer.stop()
	$Ball.resetPosition(Vector2(150,150))
	get_node("Ball").set_block_signals(true)
	$Ball.set_visible(true)
	get_node("Ball").set_block_signals(false)
	$Ball.setStartingVelocity()

func _on_ball_visibility_changed() -> void:
	if !ballCreate:
		ballCreate = true
	else:
		$BallSpawnTimer.start()
	
