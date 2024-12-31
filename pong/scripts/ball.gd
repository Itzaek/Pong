extends CharacterBody2D

signal scoreSignal(playerpt)

@export var speed = 300
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = Vector2(150,randi_range(0,150))
	setStartingVelocity()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		if collision.get_collider().name == "TopWall" || collision.get_collider().name == "BottomWall":
			$WallHit.play()
		else:
			$PaddleHit.play()
		#rebound the object
	if $".".position > screen_size:
		#Send signal to update Score 1
		$Goal.play()
		emit_signal("scoreSignal", "Score1")
		set_visible(false)
		resetPosition(Vector2(150,150))
	elif $".".position < Vector2.ZERO:
		#Send signal to update Score 2
		$Goal.play()
		emit_signal("scoreSignal", "Score2")
		set_visible(false)
		resetPosition(Vector2(150,150))
		
func resetPosition(setposition: Vector2):
	position = setposition
	velocity = Vector2.ZERO

func setStartingVelocity():
	rotation = randi_range(70,-70)
	velocity = Vector2(speed,0).rotated(rotation)
