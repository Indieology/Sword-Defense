extends KinematicBody2D

export var speed: int = 12000

var velocity: Vector2 = Vector2.ZERO

onready var sword = $Sword

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		sword.position.x = -62
	elif Input.is_action_pressed("move_right"):
		velocity.x += 1
		sword.position.x = 62
	
	if  not is_on_floor():
		velocity.y += 1
	elif Input.is_action_just_pressed("jump"):
		velocity.y -= 15
	
	#velocity = velocity.normalized()
	
	move_and_slide(velocity * speed * delta, Vector2.UP)
