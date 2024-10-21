extends Node

var FILE_PATH = "res://lang/en.json"

func load_file() -> void:
	var json = JSON.new()
	var file = FileAccess.open(FILE_PATH, FileAccess.READ)
	var json_text = file.get_as_text()
	file.close()
	
	var error = json.parse(json_text)
	if error == OK:
		var data = json.data
		if typeof(data) == TYPE_DICTIONARY:
			print(data)
			print("testing keys")
			var key_1: String = data["MY_KEY"]
			print("Key 1: " + key_1)
			print("Key 2: " + data["MY_BAD_KEY"])
		else:
			print("data was of different type")

func _ready():
	load_file()
