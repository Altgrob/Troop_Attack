class_name Move
extends BaseState

func input(event: InputEvent) -> Node:
	if Input.is_action_just_pressed("SHOOT"):
		return states.Shoot
	return self

func physics_process(delta: float) -> Node:
	
	var dir = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	
	if dir == Vector2.ZERO:
		return states.Idle
	
	dir.normalized()
	actor.velocity = dir * actor.speed 
	actor.move_and_slide()
	
	return self
	
