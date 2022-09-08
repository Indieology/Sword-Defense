extends KinematicBody2D

export var health = 2

onready var player = get_parent().get_node("Player")

var velocity = Vector2.ZERO

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	velocity.y += 10
	move_and_slide(velocity)
	
	if player.global_position.x - global_position.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	
	

func _on_HurtDetector_area_entered(area):
	if area.name == "Sword":
		queue_free()
	else:
		velocity.x += rand_range(-10,10)
