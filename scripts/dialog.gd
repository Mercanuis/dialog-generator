extends Node

const FILE_PATH: String = "res://lang/en.json"

func load_file() -> Variant: 
	var json: JSON = JSON.new()
	var file: FileAccess = FileAccess.open(FILE_PATH, FileAccess.READ)
	var json_text: String = file.get_as_text()
	file.close()
	
	var error = json.parse(json_text)
	if error == OK:
		var data: Variant = json.data
		if typeof(data) == TYPE_DICTIONARY:
			return data
		else:
			print("[data] was of different type than [TYPE_DICTIONARY]")
			return null
	else:
		return null

func _ready():
	var text_dictionary = load_file()
	for key in text_dictionary:
		print("Key {0}: {1}\n".format([key, text_dictionary[key]]))
	
