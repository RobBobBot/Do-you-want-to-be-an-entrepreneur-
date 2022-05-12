extends Node2D

export var floor_map_path:NodePath
export var wall_map_path:NodePath
var floor_map:TileMap
var wall_map:TileMap

export var x:int
export var y:int


enum{
	NORTH,
	SOUTH,
	EAST,
	WEST
}

var move_stack:Array # e defapt queue

func _ready():
	
	
	$SpriteMover.start()
	
	floor_map=get_node(floor_map_path)
	wall_map=get_node(wall_map_path)
	
	move_stack.push_back(NORTH)
	move_stack.push_back(WEST)
	move_stack.push_back(SOUTH)
	move_stack.push_back(EAST)
	
	update_position()
	move_to_next()
	

func _process(delta):
	#print(x,' ',y)
	#print($Sprite.position)
	pass


func update_position():
	position=floor_map.map_to_world(Vector2(x,y))





func move_to_next():
	if move_stack.size()>0:
		$AnimationPlayer.play("move")
		var dir=move_stack.front()
		move_stack.pop_front()
		move(dir)
	else:
		$AnimationPlayer.stop()

func move(dir:int):
	var change:Vector2=Vector2(32,16) #change of sprite position
	if dir==NORTH:
		y-=1
		change.y*=-1
	elif dir==SOUTH:
		y+=1
		change.x*=-1
	elif dir==EAST:
		x+=1
	elif dir==WEST:
		x-=1
		change.x*=-1
		change.y*=-1
	else:
		#ce facusesi verisor
		return
	
	$SpriteMover.interpolate_property($Sprite, "position", Vector2.ZERO, change, 1.0)
	



func _on_SpriteMover_tween_completed(object, key): #cand s-a terminat tranzitia, se misca catre urmatorul pe care il vrea
	#print("bro")
	$Sprite.position=Vector2.ZERO
	update_position()
	move_to_next()
