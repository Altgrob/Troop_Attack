extends BaseState

func input(input: InputEvent) -> Node:
	if Input.is_action_just_pressed("JUMP"):
		return states.Jump
	return self
	

func physics_process(_delta: float) -> Node:
	
	var dir = Input.get_axis( "LEFT", "RIGHT")
	if dir != 0 : 
		return states.Walk
	
	return self
