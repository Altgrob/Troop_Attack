extends BaseState

func input(event: InputEvent) -> Node:
	
	if Input.is_action_just_pressed("SHOOT"):
		return states.Shoot
		
	if Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")	!= Vector2.ZERO:
		return states.Move
	
	return self
