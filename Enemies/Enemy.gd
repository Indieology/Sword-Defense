extends KinematicBody2D

export var health = 2
export var speed = 80
export var distance_to_attack = 60

onready var player_animation = $AnimatedSprite
onready var attack_timer = $AttackTimer
onready var player = get_parent().get_node("Player")

var velocity = Vector2.ZERO

func _process(delta):
	if player.global_position.x - global_position.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
	

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	velocity.y += 150 #gravity
	if is_on_floor():
		if player.global_position.x - global_position.x > distance_to_attack or player.global_position.x - 	global_position.x < distance_to_attack * -1:
			velocity.x = position.direction_to(player.position).x * speed
			player_animation.play("Run")
		else:
			attack()
	move_and_slide(velocity, Vector2.UP)
	
	
func _on_HurtDetector_area_entered(area):
	if area.name == "Sword":
		queue_free()

func attack():
	if attack_timer.is_stopped():
		player_animation.play("Attack")
		attack_timer.start()


func _on_AnimatedSprite_animation_finished():
	if velocity.x == 0:
		player_animation.play("Idle")
	else:
		player_animation.play("Run")
