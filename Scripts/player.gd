extends CharacterBody2D

@onready var animatedsprite = $AnimatedSprite2D
var speed = 100.0
var last_direction = "down"

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()

func get_input():
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	print(input_direction)
	
	if input_direction == Vector2.ZERO:
		velocity = Vector2.ZERO
		update_animation("idle")
		return

	if abs(input_direction.x) > abs(input_direction.y):
		#Movimiento horizontal
		if input_direction.x > 0:
			last_direction = "right"
		else:
			last_direction = "left"
	else:
		#Movimiento vertical
		if input_direction.y > 0:
			last_direction = "down"
		else:
			last_direction = "up"
		
	update_animation("run")
	velocity = input_direction * speed

func update_animation(state):
	animatedsprite.play(state + last_direction)
	
