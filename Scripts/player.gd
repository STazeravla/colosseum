extends CharacterBody2D

@export var speed := 80.0 # más lento que normal

func _physics_process(delta):
	var direction = 0
	
	if Input.is_action_pressed("ui_right"):
		direction += 1
	if Input.is_action_pressed("ui_left"):
		direction -= 1
	
	velocity.x = direction * speed
	
	move_and_slide()
	
	
