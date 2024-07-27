extends Actor

@export var jump_force : float = 300.0

signal player_death

var is_playing_back = false
var playback_index = 0
var playback_start_time = 0
var recorded_inputs = []

func _ready() -> void:
	super()
	add_to_group("Player")
	playback_start_time = Time.get_unix_time_from_system() * 1000
	
func _input(event: InputEvent) -> void:
	# Only if part of player group 
	if Input.is_anything_pressed():
		print(Time.get_ticks_msec() * 1000)
		recorded_inputs.append({"action": event.as_text(), "timestamp": Time.get_unix_time_from_system() * 1000})
	state_machine.input(event)


func _process(delta: float) -> void:
	super(delta)
	if is_playing_back && playback_index < recorded_inputs.size():
		var current_time = (Time.get_unix_time_from_system() * 1000) - playback_start_time
		var record = recorded_inputs[playback_index]

		# Check if it's time to play this recorded input
		if current_time >= record["timestamp"]:
			# Parse the event
			var event = InputEventAction.new()
			event.action = record["action"]
			Input.parse_input_event(event)

			# Move to the next recorded input
			playback_index += 1
		elif playback_index >= recorded_inputs.size():
			is_playing_back = false
	
func _physics_process(delta: float) -> void:
	super(delta)
	velocity.y += gravity * delta
	move_and_slide()

######## LOGIC ########

func kill() -> void:
	emit_signal("player_death", self)
	queue_free()
	
######## SIGNALS ########
