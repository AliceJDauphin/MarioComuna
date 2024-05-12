extends Node2D
##instanciar particula cena
var mouseDirection = Vector2();
@onready var RayCast  = $Tiro
@export var Projetil = load("res://elements/player/projetil.tscn")
var maxRay = 200
var alvo = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	if Input.is_action_just_pressed("Shoot"):
		$Tiro/Arma.add_child($Tiro/Arma/ParticulasArma.duplicate())
		var temp = Projetil.instantiate()
		add_sibling(temp)
		temp.look_at(mouseDirection)
		temp.global_position = get_node("Tiro").get("global_position")
		
		temp.set("spawn", (get_global_mouse_position() - self.global_position).normalized())
		print("tiro")
		
	
func _input(event):
	if event is InputEventMouseMotion:
		mouseDirection = get_global_mouse_position() 
		RayCast.look_at(mouseDirection)
		if RayCast.global_rotation < 1.55 && RayCast.global_rotation > -1.55:
			$Tiro/Arma.scale.y = -0.22
		else : 
			$Tiro/Arma.scale.y = 0.22

func _on_particulas_arma_finished():
	print("porra")

func _on_child_order_changed():
	print("filha")
