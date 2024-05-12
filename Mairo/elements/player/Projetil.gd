extends Area2D

var spawn = Vector2(0,0)
var speed = 10000

func _process(delta):
	self.translate(spawn * speed * delta)
	
func _on_body_entered(body):
	body.hit()
	self.queue_free()
