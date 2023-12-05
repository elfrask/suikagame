extends Node2D

@onready var IMGS = [$fruit0, $fruit1, $fruit2, $fruit3, $fruit4, $fruit5, $fruit6, $fruit7, $fruit8, $fruit9, $fruit10]

func set_fruit(fruit: int):
	
	for i in IMGS:
		i.visible = false
	
	IMGS[fruit].visible = true
	pass
