extends Node

const FILE_PATH: String = "res://lang/en.json"


func load_file() -> void:
	var json: JSON = JSON.new()
	var file: FileAccess = FileAccess.open(FILE_PATH, FileAccess.READ)
	var json_text: String = file.get_as_text()
	file.close()
	
	var error = json.parse(json_text)
	if error == OK:
		var data: Variant = json.data
		if typeof(data) == TYPE_DICTIONARY:
			print(data)
			print("Testing keys\n")
			var key_1: String = data["MY_KEY"]
			print("Key {0}: {1}\n".format(["1", key_1]))
			print("Key {0}: {1}\n".format(["2", data["MY_BAD_KEY"]]))
		else:
			print("[data] was of different type than [TYPE_DICTIONARY]")

func _ready():
	load_file()
