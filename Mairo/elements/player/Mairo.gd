extends CharacterBody2D

@onready var animationPlayer = $AnimationPlayer

var directionX = 0
var directionY = 0
const SPEED = 200.0

func _ready():
	animationPlayer.play("idle")
func _physics_process(_delta):
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var directionX = Input.get_axis("Left", "Right")
	var directionY = Input.get_axis("Up", "Down")
	if directionX || directionY:
		animationPlayer.play("walking")
		##botão correr, está pressionado
		if Input.is_action_pressed("Run") :
			animationPlayer.speed_scale = 2
			velocity.y = directionY * SPEED*2
			velocity.x = directionX * SPEED*2
			if velocity.x != 0:
				$Mairo.scale.x = 2.35 * directionX
		##botão correr liberado
		else:	
			animationPlayer.speed_scale = 1
			velocity.y = directionY * SPEED
			velocity.x = directionX * SPEED
			if velocity.x != 0:
				$Mairo.scale.x = 2.35 * directionX
	else:
		animationPlayer.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
func get_direction():
	var Direction = Vector2(directionX,directionY)
	return Direction
