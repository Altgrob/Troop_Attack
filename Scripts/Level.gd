extends Node2D

func _ready():
	var player : CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]
	if player:
		player.player_death.connect(_on_player_death)
	for unit in MANAGER.units_to_instantiate:
		var scene_path = "res://Scenes/Actors/" + unit.name + ".tscn"
		var unit_scn = load(scene_path)
		var unit_instance = unit_scn.instantiate()
		unit_instance.global_position = $StartPosition.global_position
		unit_instance.is_playing_back = true
		unit_instance.recorded_inputs = unit.recorded_inputs
		add_child(unit_instance)
		# Instatiate every units 


func _on_player_death(unit: CharacterBody2D) -> void:
	
	MANAGER.units_to_instantiate.push_back({"name": unit.name, "recorded_inputs": unit.recorded_inputs})
