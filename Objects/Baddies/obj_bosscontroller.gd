extends Node2D

# Player health
var player_hpmax = 1500
var player_hp = 1500

# Round stuff
var maxminutes = 0
var maxseconds = 45

var minutes = maxminutes
var seconds = maxseconds

var rounds_count = 1
var rounds_max = 6

var timer_buffer = 180
var intro_buffer = 300

var bossID
var state = global.bossstates.arenaintro

# Fade in
var fade = 1.0
var rect: Rect2

func _process(delta):
	$PlayerHP.max_value = player_hpmax
	$PlayerHP.value = player_hp
	match state:
		global.bossstates.arenaintro:
			if (intro_buffer > 0):
				intro_buffer -= 1
			else:
				state = global.bossstates.arenaroundstart
		global.bossstates.arenaroundstart:
			if (timer_buffer > 0):
				timer_buffer -= 1
			else:
				minutes = maxminutes
				seconds = maxseconds
				$TimerTimer.start()
				state = global.bossstates.arenaround
				utils.get_player().state = global.states.normal
		global.bossstates.transitioncutscene:
			for i in get_tree().get_nodes_in_group("obj_baddie"):
				i.destroy()
			if (player_hp > 0):
				if (!utils.instance_exists_level(bossID)):
					fade -= 0.05
					fade = clamp(fade, 0, 1)
		global.bossstates.victory, global.bossstates.gameover:
			fade -= 0.05
			fade = clamp(fade, 0, 1)
	# Draw the text
	if (state == global.bossstates.arenaroundstart):
		$RoundText.visible = true
		$RoundText.text = "ROUND " + str(rounds_count)
	else:
		$RoundText.visible = false
	if (state == global.bossstates.arenaround):
		$Timer.visible = true
		if (seconds < 10):
			$Timer.text = str(minutes) + ":0" + str(seconds)
		elif (seconds >= 10):
			$Timer.text = str(minutes) + ":" + str(seconds)
	else:
		$Timer.visible = false
	# Fade in
	var obj_camera = utils.get_instance("obj_camera")
	rect.position.x = obj_camera.global_position.x - 50000
	rect.position.y = obj_camera.global_position.y - 50000
	rect.end.x = obj_camera.global_position.x + 50000
	rect.end.y = obj_camera.global_position.y + 50000
	update()
	
func _draw():
	if (state == global.bossstates.transitioncutscene || state == global.bossstates.victory || state == global.bossstates.gameover):
		draw_rect(rect, Color(1.0, 1.0, 1.0, fade))

func _on_TimerTimer_timeout():
	if (state == global.bossstates.transitioncutscene):
		return
	if (state == global.bossstates.victory):
		return
	seconds -= 1
	if (seconds == -1):
		if (minutes > 0):
			seconds = 59
			minutes -= 1
		else:
			seconds = 0
			minutes = 0
	if (minutes == 0 && seconds == 0):
		if (rounds_count < rounds_max):
			rounds_count += 1
			minutes = maxminutes
			seconds = maxseconds
			state = global.bossstates.arenaroundstart
			timer_buffer = 180
	if (state != global.bossstates.arenaroundstart && state != global.bossstates.victory && state != global.bossstates.transitioncutscene):
		$TimerTimer.start()
