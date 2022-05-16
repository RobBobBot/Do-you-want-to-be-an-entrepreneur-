extends Node2D

export var floor_map_path:NodePath
export var wall_map_path:NodePath
var floor_map:TileMap
var wall_map:TileMap

export var x:int
export var y:int


const NORTH=Vector2(0,-1)
const SOUTH=Vector2(0,1)
const EAST=Vector2(1,0)
const WEST=Vector2(-1,0)


var move_stack:Array # e defapt queue

func _ready():
	
	
	$SpriteMover.start()
	
	floor_map=get_node(floor_map_path)
	wall_map=get_node(wall_map_path)
	
	make_path_to_target(Vector2(10,10))
	
	update_position()
	move_to_next()
	

func _process(delta):
	#print(x,' ',y)
	#print($Sprite.position)
	pass


func update_position():
	position=floor_map.map_to_world(Vector2(x,y))



func make_path_to_target(tar:Vector2): #foloseste lee ca sa updateze vectorul de miscare
	
	var queue:Array
	var dir:Dictionary
	queue.push_back(Vector2(x,y))
	dir[queue.front()]=-1
	
	#$Icon.global_position=floor_map.map_to_world(Vector2(x,y))
	
	while !queue.empty():
		var current:Vector2=queue.front()
		queue.pop_front()
		if current==tar:
			break
		if floor_map.get_cell(current.x,current.y) != TileMap.INVALID_CELL:
			if !dir.has(current+EAST):
				dir[current+EAST]=EAST
				queue.push_back(current+EAST)
			if !dir.has(current+NORTH):
				dir[current+NORTH]=NORTH
				queue.push_back(current+NORTH)
			if !dir.has(current+WEST):
				dir[current+WEST]=WEST
				queue.push_back(current+WEST)
			if !dir.has(current+SOUTH):
				dir[current+SOUTH]=SOUTH
				queue.push_back(current+SOUTH)
	
	if dir.has(tar):
		move_stack.clear()
		var current:Vector2=tar
		while current!=Vector2(x,y):
			move_stack.push_front(dir[current])
			current-=dir[current]
	print(move_stack)



func move_to_next():
	if move_stack.size()>0:
		$AnimationPlayer.play("move")
		var dir=move_stack.front()
		move_stack.pop_front()
		move(dir)
	else:
		$AnimationPlayer.stop()

func move(dir:Vector2):
	var change:Vector2=Vector2(32,16) #change of sprite position
	change.y*=(dir.y+dir.x)
	change.x*=(dir.x-dir.y)
	
	x+=dir.x
	y+=dir.y
	$SpriteMover.interpolate_property($Sprite, "position", Vector2.ZERO, change, 0.5)
	



func _on_SpriteMover_tween_completed(object, key): #cand s-a terminat tranzitia, se misca catre urmatorul pe care il vrea
	#print("bro")
	$Sprite.position=Vector2.ZERO
	update_position()
	move_to_next()
