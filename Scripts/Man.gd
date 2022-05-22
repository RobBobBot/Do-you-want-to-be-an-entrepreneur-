extends Node2D
class_name Man

export var floor_map_path:NodePath
var floor_map:TileMap

export var x:int
export var y:int
export var move_time:float=0.5
export var idle_chance:float=0.2

export var message:PackedScene=preload("res://Scenes/People/Message.tscn")
export var talk_time=1

const NORTH=Vector2(0,-1)
const SOUTH=Vector2(0,1)
const EAST=Vector2(1,0)
const WEST=Vector2(-1,0)
const IDLE=Vector2(0,0)
onready var sprite_mover
onready var animation_player=$AnimationPlayer
onready var sprite=$Sprite
const emote_x=2

var move_stack:Array # e defapt queue

func _ready():
	begin()

func begin():
	sprite_mover.start()
	sprite_mover.connect("tween_completed",self,"_on_SpriteMover_tween_completed")
	floor_map=get_node(floor_map_path)
	update_position()
	

func _process(delta):
	#print(x,' ',y)
	#print($Sprite.position)
	pass


func update_position():
	position=floor_map.map_to_world(Vector2(x,y))



func make_path_to_target(tar:Vector2, del_last:bool=0): #foloseste lee ca sa updateze vectorul de miscare
	#print(tar)
	var queue:Array
	var dir:Dictionary
	queue.push_back(Vector2(x,y))
	dir[queue.front()]=Vector2(0,0)
	
	#$Icon.global_position=floor_map.map_to_world(Vector2(x,y))
	
	var wall_id=Values.tiles.find_tile_by_name("Wall")
	
	while !queue.empty():
		var current:Vector2=queue.front()
		queue.pop_front()
		if current==tar:
			break
		if floor_map.get_cell(current.x,current.y) != TileMap.INVALID_CELL and floor_map.get_cell(current.x,current.y) != wall_id:
			var possible_moves=[NORTH,SOUTH,EAST,WEST]
			possible_moves.shuffle()
			for direction in possible_moves:
				if !dir.has(current+direction):
					dir[current+direction]=direction
					queue.push_back(current+direction)
	
	if dir.has(tar):
		#move_stack.clear()
		var current:Vector2=tar
		if del_last:
			current-=dir[current]
		
		while current!=Vector2(x,y):
			
			move_stack.push_front(dir[current])
			if Globals.rng.randf_range(0,1)<idle_chance:
				move_stack.push_front(IDLE)
			current-=dir[current]
	#print(move_stack)

func show_message(message_val:int,wait_for_completion:bool=false):
	if wait_for_completion:
		move_stack.push_front(Vector2(emote_x,message_val)) #cod secret
		return
	var mes=message.instance()
	mes.message=message_val
	mes.time=talk_time
	$Sprite.add_child(mes)

func move_to_next():
	if move_stack.size()>0:
		animation_player.play("move")
		var dir=move_stack.front()
		move_stack.pop_front()
		move(dir)
	else:
		animation_player.stop()

func move(dir:Vector2):
	if dir.x==emote_x:
		sprite_mover.interpolate_property(sprite, "position", Vector2.ZERO, Vector2.ZERO, talk_time)
		sprite_mover.start()
		show_message(dir.y)
		return
	var change:Vector2=Vector2(32,16) #change of sprite position
	change.y*=(dir.y+dir.x)
	change.x*=(dir.x-dir.y)
	
	x+=dir.x
	y+=dir.y
	sprite_mover.interpolate_property(sprite, "position", Vector2.ZERO, change, move_time)
	sprite_mover.start()
	#print(x,' ',y)
	



func _on_SpriteMover_tween_completed(object, key): #cand s-a terminat tranzitia, se misca catre urmatorul pe care il vrea
	#print("bro")
	sprite.position=Vector2.ZERO
	update_position()
	move_to_next()
