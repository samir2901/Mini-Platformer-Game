extends KinematicBody2D

const UP = Vector2(0,-1)
const ACCELERATION = 50
const MAXSPEED = 200
const GRAVITY = 10
const JUMPHEIGHT = -550
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+ACCELERATION, MAXSPEED)
		$Sprite.flip_h = false
		$Sprite.play("Walk")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAXSPEED)
		$Sprite.flip_h = true
		$Sprite.play("Walk")
	else:
		friction = true
		$Sprite.play("Stand")
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMPHEIGHT
		if friction == true:
			motion.x = lerp(motion.x,0,0.2)
	else:
		$Sprite.play("Jump")
		if friction == true:
			motion.y = lerp(motion.y,0,0.015)
		
	motion = move_and_slide(motion,UP)
