extends Control

@onready var retry_btn : Button = $Retry

func _ready() -> void:
	$Retry.set_visible(false)
	$Retry.pressed.connect(_on_retry_pressed)
	
	# NOT A VERY 
	var player : CharacterBody2D = get_tree().get_nodes_in_group("Player")[0]
	if player:
		player.player_death.connect(_on_player_death)
	
	
###### SIGNALS ######
func _on_player_death(_unit: CharacterBody2D) -> void:
	$Retry.set_visible(true)

func _on_retry_pressed() -> void:
	$Retry.set_visible(false)
	get_tree().reload_current_scene()
