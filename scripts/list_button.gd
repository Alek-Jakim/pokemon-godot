extends Button


var state
var type
signal press(state, type)

func setup(menu_state, button_type):
	@warning_ignore('incompatible_ternary')
	var data = Global.monster_data if menu_state == Global.State.SWAP else Global.item_data
	$HBoxContainer/Label.text = data[button_type]['name']
	$HBoxContainer/TextureRect.texture = load(data[button_type]['icon'])
	state = menu_state
	type = button_type
	
	
func _on_pressed() -> void:
	press.emit(state, type)
