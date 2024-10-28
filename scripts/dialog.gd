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
			print("[dialog:load_file]: data is not of type DICTIONARY")
			return null
	else:
		print("[dialog:load_file]: unable to parse JSON")
		return null


func _ready():
	var text_dictionary = load_file()
	if text_dictionary != null:	
		for key in text_dictionary:
			print("Key {0}: {1}\n".format([key, text_dictionary[key]]))
	else:
		print("[dialog:_ready]: unable to load dictionary")
