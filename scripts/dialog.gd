### [DialogUtility]
### Utility Class that helps load the dialog
### This class will load the file (right now a static path, could be configurable)
### And load the dictionary
### File MUST be JSON for now as that is what is supported in Godot natively
class_name DialogUtility
extends Node

## FILE_PATH is the static path of the file
## 'lang' is the language directory
const FILE_PATH: String = "res://lang/en.json"

## Stores the dictionary: the parse result of the JSON file
var text_dictionary


func _ready():
	# Call the file loader
	text_dictionary = _load_file()
	
	# Check to make sure the result is okay (!= null)
	if text_dictionary != null:	
		print("[dialog:_ready] dictionary intialized")
	else:
		print("[dialog:_ready]: unable to load dictionary")


# Loads the file from the JSON
# Returns: [Variant] if the data is TYPE_DICTIONARY, else null
func _load_file() -> Variant: 
	
	# Create new JSON parser
	var json: JSON = JSON.new()
	# Open the file, read the contents, and close afterwards
	var file: FileAccess = FileAccess.open(FILE_PATH, FileAccess.READ)
	var json_text: String = file.get_as_text()
	file.close()
	
	# Parse the file data, [parse] returns an enum (OK, ERROR) of the result
	var error = json.parse(json_text)
	if error == OK:
		# JSON returns a [Variant] per the documentation
		# Check to make sure its a dictionary as that's what we want
		var data: Variant = json.data
		if typeof(data) == TYPE_DICTIONARY:
			return data
		else:
			print("[dialog:load_file]: data is not of type DICTIONARY")
			return null
	else:
		print("[dialog:load_file]: unable to parse JSON")
		return null

## Returns the [String] value in the dictionary for the given [key]
func get_dialog(key: String) -> String:
	return text_dictionary[key]
