extends Node


	
@onready var parallax_2d: Parallax2D = $Parallax2D
@export var enemy_scene: PackedScene
@export var fruit_scene: PackedScene
@export var arm_scene: PackedScene

var velocityParallax := 100


func _ready() -> void:
	#Global.lifes = initial_lifes
	Global.score = 0
	create_enemy()
	Global.connect("create_arm_score", create_arm)

#var flag_arm = true
func _process(delta: float) -> void:
	parallax_2d.scroll_offset.x -= velocityParallax * delta
	$Parallax2D3.scroll_offset.x -=velocityParallax * delta

	
	## Cada 5 score aparece el arm
	#if Global.score != 0 and Global.score % 5 and flag_arm:
		#create_arm()
		#flag_arm = false

func _on_timer_velocity_timeout() -> void:
	# Después de terminar el tiempo se ejecuta este código
	# velocityParallax += 50
	pass

func _on_timer_enemy_timeout() -> void:
	create_enemy()
	
func create_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.position.x = 600
	enemy.position.y = 223
	add_child(enemy)
	# Global.score += 1

func create_arm():
	var arm = arm_scene.instantiate()
	arm.position.x = 600
	arm.position.y = 223
	add_child(arm)

func create_frut():
	var frut = fruit_scene.instantiate()
	frut.position.y = 142
	frut.position.x = 600
	
	
	
	# Alernativa #02
	$TimerFrut.wait_time = randf_range(0.0, 5.0)
	
	add_child(frut)

func _on_timer_frut_timeout() -> void:
	create_frut()
