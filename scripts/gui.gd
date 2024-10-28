class_name GUI
extends VBoxContainer

@onready var _dialog_utils: DialogUtility = $NodeDialogScript


func _init() -> void:
	pass
	

func _ready() -> void:
	var start_dialog = _dialog_utils.get_dialog("ENTRY_POINT")
	$HBCDialogBox/LabelTextWall.set_text(start_dialog)
	print("[GUI._ready] initialized successfully")
	$LabelPlaceholder.hide()


func _process(_delta: float) -> void:
	pass
