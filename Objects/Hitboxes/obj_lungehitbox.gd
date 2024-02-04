extends Area2D

func _process(delta):
	var obj_player = utils.get_player()
	if (obj_player.state != global.states.handstandjump):
		queue_free()
	position.x = obj_player.position.x + (24 * obj_player.xscale)
	position.y = obj_player.position.y
