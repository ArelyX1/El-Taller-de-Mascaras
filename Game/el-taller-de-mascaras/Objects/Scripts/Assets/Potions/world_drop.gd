extends Control

const WORLD_ITEM = preload("uid://d06616oqh27ou")

func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	return true

func _drop_data(at_position: Vector2, data: Variant) -> void:
	var node = WORLD_ITEM.instantiate()
	
	node.set_meta("item_data", data.item)
	node.get_node("MeshInstance3D").mesh = data.item.mesh
	get_tree().current_scene.add_child(node)
	data.item = null
	node.global_position = Vector3(randf(), 1, randf())

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && Global.isInventary:
		if event.pressed:
			var cam := get_viewport().get_camera_3d()
			var space := cam.get_world_3d().direct_space_state
			
			var param = PhysicsRayQueryParameters3D.new()
			param.from = cam.project_ray_origin(event.position)
			param.to = param.from + cam.project_ray_normal(event.position) * 100

			var ray := space.intersect_ray(param)
			if ray and ray["collider"] is RigidBody3D:
				var world_item = ray["collider"]
				for slot in get_tree().root.find_child("InventoryGridContainer", true, false).get_children():
					if slot.item: continue
					slot.item = ray["collider"].get_meta("item_data")
					slot.update_ui()
					world_item.queue_free()
					break
