extends Camera2D

var zoomspeed = 100
var zoommargin = 1

var zoomMin = 0.3
var zoomMax = 0.5

var zoomfactor = 1.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	zoom.x = lerp(zoom.x, zoom.x * zoomfactor, zoomspeed * delta)
	zoom.y = lerp(zoom.y, zoom.y * zoomfactor, zoomspeed * delta)
	zoom.x = clamp(zoom.x, zoomMin, zoomMax)
	zoomfactor = clamp(zoomfactor, 0.8, 1)
	zoom.y = clamp(zoom.y, zoomMin, zoomMax)
	
	if Input.is_action_pressed("Run") :
		zoomfactor -= 0.1 * delta
	else:
		zoomfactor += 0.1
	
