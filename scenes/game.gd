extends Control


func _ready() -> void:
	Global.current_monster = Global.monsters[1]
	$AttackSprite.hide()

func _on_input_menu_selected(state: int, type: Variant) -> void:
	match state:
		Global.State.ATTACK:
			var target = $Monsters/Enemy if Global.attack_data[type]['target'] else $Monsters/Player
			attack(target, type)


func attack(target: TextureRect, attack_type: Global.Attack):
	
	var current_attack = Global.attack_data[attack_type]
	
	var target_pos = target.get_rect().position + target.get_rect().size / 2
	
	
	$AttackSprite.position = target_pos
	

	$AttackSprite.show()
	$AttackSprite.frame = 0
	
	var attack_image = current_attack['animation']
	$AttackSprite.texture = load(attack_image)
	
	var tween = create_tween()
	tween.tween_property($AttackSprite, "frame", 4, 0.5).from(0)
	tween.tween_property($AttackSprite, "visible", false, 0)
