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

# Intro
var intro_buffer = 300
var playerx = -415
var bossx = 960
var versusy = -400

var bossID
var state = global.bossstates.arenaintro

var is_bossside = false
var playerpos = 112
var bosspos = 816

# Fade in
var fade = 1.0
var rect: Rect2

func player_arenaroundstart():
	var player = utils.get_player()
	var playerspeed = 6
	var newpos = playerpos if !is_bossside else bosspos
	
	if (int(player.position.x) != newpos && player.sprite_index != "move" && player.is_on_floor()):
		player.velocity.x = -playerspeed if !is_bossside else playerspeed
	elif (((int(player.position.x) <= newpos && newpos == playerpos) || (int(player.position.x) >= newpos && newpos == bosspos)) && player.velocity.x != 0):
		player.position.x = newpos
		player.xscale = -sign(player.velocity.x)
		player.velocity.x = 0
	if (player.velocity.x != 0 && player.is_on_floor()):
		player.charactersprite.speed_scale = 0.6
		player.set_animation("move")
		player.xscale = sign(player.velocity.x)
	else:
		player.charactersprite.speed_scale = 0.35
		if (player.is_on_floor()):
			player.set_animation("idle")
		else:
			player.set_animation("fall")

func _process(delta):
	$PlayerHP.max_value = player_hpmax
	$PlayerHP.value = player_hp
	var obj_player = utils.get_player()
	if (bossID != null):
		if (!utils.instance_exists_level(bossID) && state != global.bossstates.victory):
			state = global.bossstates.victory
			$EndTimer.start()
	if (player_hp <= 0):
		if (state != global.bossstates.gameover):
			state = global.bossstates.gameover
			$EndTimer.start()
	match state:
		global.bossstates.arenaintro:
			# Peppino VS screen
			obj_player.state = global.states.actor
			obj_player.xscale = -1 if obj_player.position.x > 480 else 1
			if (playerx != 0):
				playerx += 5
			if (bossx != 545):
				bossx -= 5
			if (versusy != 0):
				versusy += 5
			if (intro_buffer > 0):
				intro_buffer -= 1
			else:
				state = global.bossstates.arenaroundstart
		global.bossstates.arenaroundstart:
			if (timer_buffer > 0):
				timer_buffer -= 1
				if (obj_player.state != global.states.actor && obj_player.state != global.states.hurt):
					obj_player.movespeed = 0
					obj_player.velocity.x = 0
					obj_player.velocity.y = 0
					obj_player.set_animation("idle")
					obj_player.charactersprite.speed_scale = 0.35
					obj_player.state = global.states.actor
					obj_player.xscale = -1 if obj_player.position.x > 480 else 1
					is_bossside = true if obj_player.position.x > 480 else false
				if (obj_player.state == global.states.actor):
					player_arenaroundstart()
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
	if (state == global.bossstates.arenaintro):
		var shakex = utils.randi_range(-1, 1)
		var shakey = utils.randi_range(-1, 1)
		$Intro/Peppino.position.x = playerx
		$Intro/Boss.position.x = bossx
		$Intro/VersusTitle.position.x = 0 + shakex
		$Intro/VersusTitle.position.y = versusy + shakey
		$Intro.visible = true
	else:
		$Intro.visible = false
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

func _on_EndTimer_timeout():
	utils.get_player().scr_playerreset()
	global.targetDoor = "A"
	utils.room_goto("", "hub_room1")
