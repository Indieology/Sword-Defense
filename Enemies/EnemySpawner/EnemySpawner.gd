extends Node2D

onready var spawn_timer = $Timer

onready var skeleton_scene = preload("res://Enemies/Enemy.tscn")


func _ready():
	pass # Replace with function body.

func _process(delta):
	if spawn_timer.is_stopped():
		var new_enemy = skeleton_scene.instance()
		get_parent().add_child(new_enemy)
		new_enemy.global_position = global_position
		spawn_timer.start(2)
