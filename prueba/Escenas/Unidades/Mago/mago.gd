extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

var health = 100
var  damage= 20
var attack_range = 100
var attack_speed = 1 
var enemies = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("Idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("algo entró")
	enemies.append(body)
	print(enemies.size())

func _on_area_2d_body_exited(body: Node2D) -> void:
	enemies.erase(body)
	print(enemies.size())
