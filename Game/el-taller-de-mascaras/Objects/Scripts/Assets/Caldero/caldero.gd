extends StaticBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta): # Most things happen here.
	# SeeCast
	if %CalderoSeeCast.is_colliding():
		var target = %CalderoSeeCast.get_collider()
		if target != null && target.has_method("interactCaldero"):
			target.interactCaldero()		
