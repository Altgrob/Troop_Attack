extends Actor

@export var jump_force : float = 300.0

signal player_death

func _ready() -> void:
	super()
	add_to_group("Player")
	
func _input(event: InputEvent) -> void:
	state_machine.input(event)

	
func _physics_process(delta: float) -> void:
	super(delta)
	velocity.y += gravity * delta
	move_and_slide()

######## LOGIC ########

func kill() -> void:
	# Add unit to an array of units to be instanciated at start 
	# Destroy unit for this run 
	# Open modal to select next unit to play with
	emit_signal("player_death", self)
	queue_free()
	
######## SIGNALS ########
