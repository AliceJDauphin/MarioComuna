extends StaticBody2D

@onready var sound = $Splats/Splat
var life = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	life = 1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hitbox_body_entered(body):
	if body.name == "Player" :
		pass
	if body.name == "Pointer/Tirow" :
		hit()
	print(body.name)
	
func hit():
	life -= 1
	
	if life == 0:
		sound.play()
		sound.reparent(get_parent().get_parent())
		self.queue_free()
