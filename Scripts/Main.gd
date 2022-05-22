extends Node2D


var next_env:Node

onready var env:Node=$TitleScreen

func _on_ScreenTransition_animation_finished(anim_name):
	if anim_name == "fade_out":
		$ScreenTransition.play("fade_in")
		env.queue_free()
		env=next_env
		env.show_all()


func change_env(new_env:Node):
	next_env=new_env
	add_child(next_env)
	next_env.hide_all()
	$ScreenTransition.play("fade_out")
