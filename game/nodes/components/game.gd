extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Game.gameover = false
	Game.limit = $limit.global_position.y
	Game.Main = self
	
	%mejorpuntaje.text = str(Game.BestScore)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	%puntaje.text = str(Game.Score)
	#print($gameover.get_overlapping_bodies())
	if Game.gameover:
		return
	for i in $gameover.get_overlapping_bodies():
		if i is RigidBody2D:
			if i.is_in_group("fruit"):
				if i.gameover():
					gameover()
		pass
	pass
	
func gameover():
	$gameOver/ColorRect/puntaje.text = str(Game.Score)
	$gameOver/ColorRect/mejorpuntaje.text = str(Game.BestScore)
	$box/gover.play("lose")
	Game.gameover = true
	
	if Game.BestScore < Game.Score:
		
		Game.BestScore = Game.Score
		Game.savescore()
	pass


func _on_gameover_body_entered(body):
	print(body)
	
	if body is RigidBody2D:
		if body.is_in_group("fruit"):
			if body.gameover:
				if !Game.gameover:
					gameover()
					pass
				
				pass
			else:
				pass#body.gameover = true
	pass # Replace with function body.


func _on_gameover_body_exited(body):
	
	if body is RigidBody2D:
		if body.is_in_group("fruit"):
			body.gameover = true
	pass # Replace with function body.


func _on_texture_button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.
