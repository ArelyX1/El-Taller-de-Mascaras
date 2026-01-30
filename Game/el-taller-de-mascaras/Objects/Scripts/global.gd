extends Node

var has_diary: bool = false

var isInventary: bool = false

func DialogicStart(dialogicPath):
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	Dialogic.start(dialogicPath)
	Dialogic.timeline_ended.connect(func(): Input.mouse_mode = Input.MOUSE_MODE_CAPTURED)
 	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
