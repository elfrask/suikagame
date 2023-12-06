extends Node



var points = [1, 3, 6, 10, 15, 21, 28, 36, 45, 55, 66]

var BestScore = 0
var Score = 0
var gameover = false

var limit = 0

var Main: Node2D

func _ready():
	loadscore()
	pass

func savescore():
	var fs = FileAccess.open("user://score.json", FileAccess.WRITE)
	var data= {
		"BestScore": BestScore
	}
	
	var json = JSON.new()
	
	var cadena = json.stringify(data)
	
	fs.store_string(cadena)
	
	pass

func loadscore():
	if FileAccess.file_exists("user://score.json"):
		var fs = FileAccess.open("user://score.json", FileAccess.READ)
		var json = JSON.new()
		var cadena = fs.get_as_text()
		var data = json.parse_string(cadena)
		
		BestScore = data["BestScore"]
	
	
	pass
