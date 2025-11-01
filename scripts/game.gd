extends Control


@export var animation_index: int

func _ready() -> void:
	# Player monster setup
	Global.current_monster = Global.monsters.pop_at(0)
	$AttackSprite.hide()
	set_current_player_monster(Global.Monster.ATROX)
	
	# Enemy monster setup
	Global.current_enemy = Global.Monster.values().pick_random()
	var new_atlas: AtlasTexture = AtlasTexture.new()
	new_atlas.atlas = load(Global.monster_data[Global.current_enemy]['front texture'])
	$Monsters/Enemy.texture = new_atlas
	new_atlas.region = Rect2i(Vector2i.ZERO, Vector2i(96, 96))

func _on_input_menu_selected(state: int, type: Variant) -> void:
	match state:
		Global.State.ATTACK:
			var target = $Monsters/Enemy if Global.attack_data[type]['target'] else $Monsters/Player
			attack(target, type)
		Global.State.SWAP:
			Global.monsters.append(Global.current_monster)
			set_current_player_monster(type)
			Global.current_monster = type
			Global.monsters.erase(type)

func _process(delta: float) -> void:
	var atlas = $Monsters/Enemy.texture as AtlasTexture
	atlas.region = Rect2i(Vector2i(96 * animation_index, 0) ,Vector2i(96, 96))


func set_current_player_monster(monster_type):
	var monster = Global.monster_data[monster_type]
	
	load_sprite_texture($Monsters/Player, monster['back texture'])
	
	
func load_sprite_texture(sprite, texture_path):
	sprite.texture = load(texture_path)

func play_attack_animation():
	var tween = create_tween()
	tween.tween_property($AttackSprite, "frame", 4, 0.5).from(0)
	tween.tween_property($AttackSprite, "visible", false, 0)
	
func get_target_pos(target: TextureRect):
	return target.get_rect().position + target.get_rect().size / 2

func attack(target: TextureRect, attack_type: Global.Attack):
	var current_attack = Global.attack_data[attack_type]
	var target_pos = get_target_pos(target)
	$AttackSprite.position = target_pos

	$AttackSprite.show()
	$AttackSprite.frame = 0
	
	var attack_image = current_attack['animation']
	load_sprite_texture($AttackSprite, attack_image)
	
	play_attack_animation()
