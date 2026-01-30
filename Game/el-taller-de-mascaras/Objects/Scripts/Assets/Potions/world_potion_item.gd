extends RigidBody3D

# Asegúrate de que este nombre coincida con lo que esperas en el HUD
@export var displayName: String = "Potion" 

func interact():
	# 1. Obtenemos los datos del ítem guardados en los metadatos
	Global.DialogicStart("res://Objects/assets/potions/potionDrop.dtl")
	if not has_meta("item_data"):
		print("Error: Este objeto no tiene metadatos 'item_data'")
		return
	
	var data = get_meta("item_data")
	
	# 2. Buscamos el contenedor del inventario
	# Nota: Es mejor usar un nombre de grupo o una señal, pero siguiendo tu lógica:
	var inventory_grid = get_tree().root.find_child("InventoryGridContainer", true, false)
	
	if inventory_grid:
		for slot in inventory_grid.get_children():
			# Verificamos si el slot está libre
			if slot.item == null:
				slot.item = data
				if slot.has_method("update_ui"):
					slot.update_ui()
				# queue_free()
				return # Salimos para no llenar todos los slots con el mismo ítem
	else:
		print("No se encontró el InventoryGridContainer")
