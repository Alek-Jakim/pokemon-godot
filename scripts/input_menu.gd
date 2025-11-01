extends Control

var grid_button_scene = preload("res://scenes/grid_button.tscn")
var list_button_scene = preload("res://scenes/list_button.tscn")

var current_state: Global.State: set = state_handler
signal selected(state: Global.State, type)

const main_buttons = {
	Global.State.ATTACK: "Attack",
	Global.State.DEFEND: "Defend",
	Global.State.SWAP: "Swap",
	Global.State.ITEM: "Item"
}

# There's some z-indexing issue that needs to be fixed, this is a temporary solution
func change_container_visiblity(visibleContainer: Container, invisibleContainer: Container):
	visibleContainer.show()
	invisibleContainer.hide()

func _ready() -> void:
	current_state = Global.State.MAIN
	
# This is to get back to the main menu
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		current_state = Global.State.MAIN


func clear_grid_container(container: Container):
	for i in container.get_children():
		i.queue_free()


func create_grid_buttons(state: Global.State, data: Dictionary):
	# Safeguard to make sure there are no elements inside the grid container
	clear_grid_container($GridContainer)
	change_container_visiblity($GridContainer, $ScrollContainer)

	for key in data:
		var grid_button = grid_button_scene.instantiate() as Button
		grid_button.setup(state, key, data[key])
		$GridContainer.add_child(grid_button)
		grid_button.connect("press", button_handler)
	await get_tree().process_frame
	$GridContainer.get_child(0).grab_focus()
		
		
func create_list_buttons(state: Global.State, data: Array):
	# Safeguard to make sure there are no elements inside the grid container
	clear_grid_container($ScrollContainer/VBoxContainer)
	change_container_visiblity( $ScrollContainer, $GridContainer)
	
	for i in data:
		var list_button = list_button_scene.instantiate()
		$ScrollContainer/VBoxContainer.add_child(list_button)
		list_button.setup(state, i)
		list_button.connect('press', button_handler)
	await get_tree().process_frame
	$ScrollContainer/VBoxContainer.get_child(0).grab_focus()
		
func button_handler(state, type):
	if state == Global.State.MAIN:
		current_state = type
		if type == Global.State.DEFEND:
			selected.emit(Global.State.DEFEND, type)
	else:
		selected.emit(state, type)


func state_handler(value):
	current_state = value
	
	match value:
		Global.State.MAIN:
			create_grid_buttons(Global.State.MAIN, main_buttons)
		Global.State.ATTACK:
			var monster_attacks = Global.monster_data[Global.current_monster]['attacks']
			var monster_attack_names = {}
			for i in 4:
				monster_attack_names[i] = Global.attack_data[monster_attacks[i]]['name']
			create_grid_buttons(Global.State.ATTACK, monster_attack_names)
		
		
		Global.State.ITEM:
			create_list_buttons(Global.State.ITEM, Global.items)
			
		Global.State.SWAP:
			create_list_buttons(Global.State.SWAP, Global.monsters)
