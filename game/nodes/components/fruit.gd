extends RigidBody2D
var fruit = 0

enum FRUIT {
	cereza,
	fresa,
	uvas,
	naranja,
	mandarina,
	manzana,
	parchita,
	durazno,
	piña,
	melon,
	sandia
}

var FruitInstance = preload("res://nodes/components/fruit.tscn")

@export var fruitInitial: FRUIT = 0

@onready var IMG_FRUITS = [$fruits/fruit0, $fruits/fruit1, $fruits/fruit2, $fruits/fruit3, $fruits/fruit4, $fruits/fruit5, $fruits/fruit6, $fruits/fruit7, $fruits/fruit8, $fruits/fruit9, $fruits/fruit10]
@onready var COLL_FRUITS = [$coll0, $coll1, $coll2, $coll3, $coll4, $coll5, $coll6, $coll7, $coll8, $coll9, $coll10]
@onready var COLL_FRUITS_ST = [$st/coll0, $st/coll1, $st/coll2, $st/coll3, $st/coll4, $st/coll5, $st/coll6, $st/coll7, $st/coll8, $st/coll9, $st/coll10]

var gameover = false
# Called when the node enters the scene tree for the first time.
func renew():
	
	for i in range(0, 11):
		IMG_FRUITS[i].visible = false
		COLL_FRUITS[i].disabled = true
		COLL_FRUITS_ST[i].disabled = true
	
	
	IMG_FRUITS[fruit].visible = true
	COLL_FRUITS[fruit].disabled = false
	COLL_FRUITS_ST[fruit].disabled = false
	
	pass # Replace with function body.

func _ready():
	fruit = fruitInitial
	renew()
	pass

func set_fruit(fr: int):
	fruit = fr
	#renew()

func _draw():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	renew()
	
	if global_position.y < Game.limit:
		if gameover:
			Game.Main.gameover()
			pass
		pass 
	
	pass


func _on_body_entered(body):
	
	
	if body is RigidBody2D:
		gameover = true
		
		if body.is_in_group("fruit"):
			if body.fruit == fruit:
				
				var position_new = (body.global_position + global_position) / 2
				
				#var new_fruit = FruitInstance.instantiate()
				
				#%content.add_child(new_fruit)
				Game.Score += Game.points[fruit]
				$sound.play(0)
				if fruit == 11:
					queue_free()
					body.queue_free()
					return 0
				set_fruit(fruit + 1)
				global_position = position_new
				
				body.queue_free()
				pass
			pass
	pass # Replace with function body.


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
