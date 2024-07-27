extends BaseState

func enter() -> void:
	actor.velocity.y -= actor.jump_force
	
	
func physics_process(delta: float) -> Node:
	var dir = Input.get_axis("LEFT", "RIGHT")
	
	actor.velocity.x = dir * actor.speed
	
	if actor.velocity.y > 0 :
		return states.Walk
	return self	
	
	
