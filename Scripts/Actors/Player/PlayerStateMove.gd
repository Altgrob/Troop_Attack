extends BaseState

func input(input: InputEvent) -> Node:
	if Input.is_action_just_pressed("JUMP"):
		return states.Jump
	return self
	
func  physics_process(delta: float) -> Node:
	var dir = Vector2(round(Input.get_axis("LEFT", "RIGHT")), 0)
	actor.set_direction(dir)
	
	actor.velocity.x = dir.x * actor.speed
	if dir.x == 0:
		return states.Idle
	
	return self
	
