extends StaticBody2D
@export var speed = 450
var key_up
var key_down
var screen_size
var paddle_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	#Rectangle was rotated, so coordinates are flipped
	paddle_size = Vector2(0, $CollisionShape2D.get_shape().size.x)
	if $".".name == "Paddle1":
		key_up = "paddle1_up"
		key_down = "paddle1_down"
	elif $".".name == "Paddle2":
		key_up = "paddle2_up"
		key_down = "paddle2_down"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed(str(key_up)):
		velocity.y -= 1
	if Input.is_action_pressed(str(key_down)):
		velocity.y += 1
	
	velocity = velocity.normalized() * speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO+(paddle_size*$".".scale/2), screen_size-(paddle_size*$".".scale/2))
