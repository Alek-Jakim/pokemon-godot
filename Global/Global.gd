extends Node

enum State {MAIN, ATTACK, DEFEND, SWAP, ITEM}
enum Monster {ATROX, CINDRILL, CLEAF, DRAEM, FINIETTE, FINSTA, FRIOLERA, GULFIN, IVIERON, JACANA, LARVEA, PLUMA, PLUMETTE, POUCH, SPARCHU, VULKEO}
enum Attack {CLAW, EXPLOSION, FIRE, HEAL, ICE, WATER}
enum Item {MUSHROOM, POTION, ELIXIR, POISON}

const monster_data: Dictionary[Monster, Dictionary] = {
	Monster.ATROX: {
		'name': 'Atrox',
		'back texture': "res://graphics/back sprites/Atrox.png",
		'front texture': "res://graphics/battle sprites/Atrox.png",
		'icon': "res://graphics/menu sprites/Atrox.png",
		'attacks': [Attack.CLAW, Attack.FIRE, Attack.HEAL, Attack.WATER],
		'max health': 60,
	},
	Monster.SPARCHU: {
		'name': 'Sparchu',
		'back texture': "res://graphics/back sprites/Sparchu.png",
		'front texture': "res://graphics/battle sprites/Sparchu.png",
		'icon': "res://graphics/menu sprites/Sparchu.png",
		'attacks': [Attack.CLAW, Attack.FIRE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 70,
	},
	Monster.CINDRILL: {
		'name': 'Cindrill',
		'back texture': "res://graphics/back sprites/Cindrill.png",
		'front texture': "res://graphics/battle sprites/Cindrill.png",
		'icon': "res://graphics/menu sprites/Cindrill.png",
		'attacks': [Attack.CLAW, Attack.FIRE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 120,
	},
	Monster.CLEAF: {
		'name': 'Cleaf',
		'back texture': "res://graphics/back sprites/Cleaf.png",
		'front texture': "res://graphics/battle sprites/Cleaf.png",
		'icon': "res://graphics/menu sprites/Cleaf.png",
		'attacks': [Attack.CLAW, Attack.FIRE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 90,
	},
	Monster.DRAEM: {
		'name': 'Draem',
		'back texture': "res://graphics/back sprites/Draem.png",
		'front texture': "res://graphics/battle sprites/Draem.png",
		'icon': "res://graphics/menu sprites/Draem.png",
		'attacks': [Attack.CLAW, Attack.FIRE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 100,
	},
	Monster.FINIETTE: {
		'name': 'Finitte',
		'back texture': "res://graphics/back sprites/Finiette.png",
		'front texture': "res://graphics/battle sprites/Finiette.png",
		'icon': "res://graphics/menu sprites/Finiette.png",
		'attacks': [Attack.CLAW, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 120,
	},
	Monster.FINSTA: {
		'name': 'Finsta',
		'back texture': "res://graphics/back sprites/Finsta.png",
		'front texture': "res://graphics/battle sprites/Finsta.png",
		'icon': "res://graphics/menu sprites/Finsta.png",
		'attacks': [Attack.CLAW, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 120,
	},
	Monster.FRIOLERA: {
		'name': 'Friolera',
		'back texture': "res://graphics/back sprites/Friolera.png",
		'front texture': "res://graphics/battle sprites/Friolera.png",
		'icon': "res://graphics/menu sprites/Friolera.png",
		'attacks': [Attack.CLAW, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 120,
	},
	Monster.GULFIN: {
		'name': 'Gulfin',
		'back texture': "res://graphics/back sprites/Gulfin.png",
		'front texture': "res://graphics/battle sprites/Gulfin.png",
		'icon': "res://graphics/menu sprites/Gulfin.png",
		'attacks': [Attack.CLAW, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 60,
	},
	Monster.IVIERON: {
		'name': 'Ivieron',
		'back texture': "res://graphics/back sprites/Ivieron.png",
		'front texture': "res://graphics/battle sprites/Ivieron.png",
		'icon': "res://graphics/menu sprites/Ivieron.png",
		'attacks': [Attack.WATER, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 70,
	},
	Monster.JACANA: {
		'name': 'Jacana',
		'back texture': "res://graphics/back sprites/Jacana.png",
		'front texture': "res://graphics/battle sprites/Jacana.png",
		'icon': "res://graphics/menu sprites/Jacana.png",
		'attacks': [Attack.WATER, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 70,
	},
	Monster.LARVEA: {
		'name': 'Larvea',
		'back texture': "res://graphics/back sprites/Larvea.png",
		'front texture': "res://graphics/battle sprites/Larvea.png",
		'icon': "res://graphics/menu sprites/Larvea.png",
		'attacks': [Attack.WATER, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 40,
	},
	Monster.PLUMA: {
		'name': 'Pluma',
		'back texture': "res://graphics/back sprites/Pluma.png",
		'front texture': "res://graphics/battle sprites/Pluma.png",
		'icon': "res://graphics/menu sprites/Pluma.png",
		'attacks': [Attack.WATER, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 200,
	},
	Monster.PLUMETTE: {
		'name': 'Plumette',
		'back texture': "res://graphics/back sprites/Plumette.png",
		'front texture': "res://graphics/battle sprites/Plumette.png",
		'icon': "res://graphics/menu sprites/Plumette.png",
		'attacks': [Attack.WATER, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 30,
	},
	Monster.POUCH: {
		'name': 'Pouch',
		'back texture': "res://graphics/back sprites/Pouch.png",
		'front texture': "res://graphics/battle sprites/Pouch.png",
		'icon': "res://graphics/menu sprites/Pouch.png",
		'attacks': [Attack.WATER, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 60,
	},
	Monster.VULKEO: {
		'name': 'Vulkeo',
		'back texture': "res://graphics/back sprites/Vulkeo.png",
		'front texture': "res://graphics/battle sprites/Vulkeo.png",
		'icon': "res://graphics/menu sprites/Vulkeo.png",
		'attacks': [Attack.WATER, Attack.ICE, Attack.EXPLOSION, Attack.HEAL],
		'max health': 250,
	},
}
const attack_data: Dictionary[Attack, Dictionary] = {
	Attack.CLAW:      {'name': 'Claw',     'amount': 10, 'animation': "res://graphics/attack effects/claw.png", 'target': 1},
	Attack.EXPLOSION: {'name': 'Explosion','amount': 20, 'animation': "res://graphics/attack effects/explosion.png", 'target': 1},
	Attack.FIRE:      {'name': 'Fire',     'amount': 20, 'animation': "res://graphics/attack effects/fire.png", 'target': 1},
	Attack.ICE:       {'name': 'Ice',      'amount': 20, 'animation': "res://graphics/attack effects/ice.png", 'target': 1},
	Attack.WATER:     {'name': 'Water',    'amount': 20, 'animation': "res://graphics/attack effects/water.png", 'target': 1},
	Attack.HEAL:      {'name': 'Heal',     'amount': -20, 'animation': "res://graphics/attack effects/heal.png", 'target': 0},
}
const item_data: Dictionary[Item, Dictionary] = {
	Item.POTION:   {'name': 'Potion', 'target': 0, 'attribute': 'health', 'amount': -20,  'icon': "res://graphics/item sprites/potion.png"},
	Item.ELIXIR:   {'name': 'Elixir', 'target': 0, 'attribute': 'health', 'amount': -50,  'icon': "res://graphics/item sprites/elixir.png"},
	Item.MUSHROOM: {'name': 'Mushroom', 'target': 1,  'attribute': 'health', 'amount': 20, 'icon': "res://graphics/item sprites/mushroom.png"},
	Item.POISON:   {'name': 'Poison', 'target': 1,  'attribute': 'health', 'amount': 50, 'icon': "res://graphics/item sprites/poison.png"}
}

var current_monster: Monster
var current_enemy: Monster
var monsters = [Monster.ATROX, Monster.SPARCHU, Monster.CINDRILL, Monster.CLEAF, Monster.GULFIN]
var items = [Item.POTION, Item. ELIXIR, Item.MUSHROOM, Item.POISON]
