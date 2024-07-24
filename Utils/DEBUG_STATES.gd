extends Label

func _ready() -> void:
	get_parent().get_node("StateMachine").state_changed.connect(_on_state_changed)


func _on_state_changed(state: Node) -> void:
	text = state.name
