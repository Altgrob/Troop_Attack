class_name BaseState
extends Node2D

@onready var animation_name := self.name
var states 

# Pass in a reference to the actor's kinematic body so that it can be used by the state
var actor : CharacterBody2D

func _ready() -> void:
	await owner.ready
	states = get_parent().states

func enter() -> void:
	actor.animation = animation_name

func exit() -> void:
	pass

# Enums are internally stored as ints, so that is the expected return type
func input(_event: InputEvent) -> Node:
	return self

func process(_delta: float) -> Node:
	return self

func physics_process(_delta: float) -> Node:
	return self

func _change_state(state: Node):
	get_parent().change_state(states[state.name])
