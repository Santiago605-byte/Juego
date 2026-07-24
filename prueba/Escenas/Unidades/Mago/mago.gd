extends Node2D

enum State {
	IDLE,
	ATTACKING,
	DEAD
}

@onready var animated_sprite = $AnimatedSprite2D

#Relacionado al mago si
var health = 100
var  damage= 20
var attack_range = 100
var attack_speed = 1 
var state = State.IDLE

#Relacionado a los enemigos
var enemies = []
var current_target = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite.play("Idle")
	print(state)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("algo entró")
	enemies.append(body)
	update_target()

func _on_area_2d_body_exited(body: Node2D) -> void:
	print("Ha salido")
	enemies.erase(body)
	update_target()

func update_target():
	if enemies.size() > 0:
		current_target = enemies[0]
		print(current_target)
	else:
		current_target = null
	update_state()
		
func update_state():
	if current_target == null:
		state = State.IDLE
	else:
		state = "Attacking"
