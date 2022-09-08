extends KinematicBody2D

export var speed: int = 12000

var velocity: Vector2 = Vector2.ZERO

onready var sword = $Sword
onready var player_sprite = $AnimatedSprite
onready var player_hands = $Hands
onready var player_collision_shape = $CollisionShape2D

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		player_sprite.play("Run")
		velocity.x -= 1
		sword.position.x = -13
		player_hands.position = Vector2(10,20)
		player_sprite.flip_h = true
		player_hands.flip_h = true
		sword.scale.x = -1
		player_collision_shape.position = Vector2(28,22)
	elif Input.is_action_pressed("move_right"):
		player_sprite.play("Run")
		velocity.x += 1
		sword.position.x = 22
		player_hands.position = Vector2(3,20)
		player_sprite.flip_h = false
		player_hands.flip_h = false
		sword.scale.x = 1
		player_collision_shape.position = Vector2(-13,22)
	if  not is_on_floor():
		velocity.y += 1
	elif Input.is_action_just_pressed("jump"):
		velocity.y -= 15
	
	if velocity == Vector2.ZERO:
		player_sprite.play("Idle")
	#velocity = velocity.normalized()
	
	move_and_slide(velocity * speed * delta, Vector2.UP)
