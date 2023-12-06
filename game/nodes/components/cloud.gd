extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0

var FruitInstance = preload("res://nodes/components/fruit.tscn")
@export var Content: NodePath = ""

var current_fruit = 0

func generate_spawn_fruit():
	
	var fruit_next = randi_range(0, 4)

	current_fruit = fruit_next
	$spawn/VisualFruit.set_fruit(current_fruit)
	
	return

func spawn_fruit(pos: Vector2):
	var fruit = FruitInstance.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	
	get_node(Content).add_child(fruit)
	fruit.set_fruit(current_fruit)	
	fruit.global_position = pos
	pass

func _ready():
	generate_spawn_fruit()


func _physics_process(delta):
	if Game.gameover:
		return 0
	
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("L", "R")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("drop"):
		if $cooldown.is_stopped():
			spawn_fruit($spawn.global_position)
			generate_spawn_fruit()
			$cooldown.start(0)
		
		pass

	move_and_slide()




func _on_coulddown_timeout():
	$cooldown.stop()
	pass # Replace with function body.
