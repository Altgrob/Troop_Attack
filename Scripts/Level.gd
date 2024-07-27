extends Node2D

var units = {
	"unit1" : "res://Scenes/Actors/unit1.tscn"
}

func _ready():
	var player : CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]
	if player:
		player.player_death.connect(_on_player_death)
	print(MANAGER.units_to_instantiate)
	for unit in MANAGER.units_to_instantiate:
		print(unit)
		var scene_path = "res://Scenes/Actors/" + unit + ".tscn"
		var unit_scn = load(scene_path)
		var unit_instance = unit_scn.instantiate()
		unit_instance.global_position = $StartPosition.global_position
		add_child(unit_instance)
		# Instatiate every units 


func _on_player_death(unit: CharacterBody2D) -> void:
	
	MANAGER.units_to_instantiate.push_back(unit.name)
