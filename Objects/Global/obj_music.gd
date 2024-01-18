extends Node2D

var roomname = ""
var music
var secretmusic
var secret = false
onready var musicnode = $music
onready var secretmusicnode = $secretmusic

# This array is arranged the following way:
#   room name      song name      secret song name     set song position at previous songs position
var room_arr = [
	["Realtitlescreen", "mu_title", "mu_scary", false],
	["characterselect", "mu_characterselect", "mu_mscary", false],
	["Titlescreen", "mu_wind", "mu_scary", false],
	["hub_room1", "mu_hub", "mu_scary", false],
	["hub_special", "mu_hub", "mu_scary", false],
	["ancient_1", "mu_tutorial", "mu_scary", false],
	["tower_1", "mu_ancient", "mu_scary", false],
	["factory_1", "mu_factory", "mu_scary", false],
	["circus_1", "mu_circus", "mu_scary", false],
	["entrance_1", "mu_entrance", "mu_scary", false],
	["medieval_1", "mu_medievalentrance", "mu_scary", false],
	["medieval_2", "mu_medievalentrance", "mu_scary", true],
	["medieval_3", "mu_medievalremix", "mu_scary", true],
	["medieval_5", "mu_medievalremix", "mu_scary", true],
	["medieval_6", "mu_medieval", "mu_scary", true],
	["ruin_1", "mu_ruin", "mu_scary", false],
	["ruin_6", "mu_ruin", "mu_scary", true],
	["ruin_7", "mu_ruinremix", "mu_scary", true],
	["dungeon_1", "mu_dungeon", "mu_scary", false],
	["dungeon_8", "mu_dungeon", "mu_scary", true],
	["dungeon_9", "mu_scary", "mu_scary", true],
	["dungeon_10", "mu_scary", "mu_scary", false],
	["boss_pepperman_chase", "mu_chase", "mu_scary", false],
	["trickytreat_1", "mu_hub", "mu_scary", false],
	["trickytreat_2", "mu_trickytreat", "mu_scary", false],
	["testroom_1", "mu_medieval", "mu_scary", false]
]

func room_start():
	if (!global.panic):
		for i in room_arr.size():
			var b = room_arr[i]
			if (global.targetRoom == b[0]):
				var prevmusic = music
				var oldmusicpos = $music.get_playback_position()
				music = b[1]
				secretmusic = b[2]
				if (music != prevmusic):
					var newmusic = load("res://Music/" + music + ".ogg")
					$music.stream = newmusic
					if (b[3]):
						$music.play(oldmusicpos)
					else:
						$music.play()
				$RestartMusicTimer.start()
	if ("secret" in global.targetRoom && !global.panic):
		secret = true
	else:
		secret = false
	if (secret):
		var newsecretmusic = load("res://Music/" + secretmusic + ".ogg")
		var musicpos = $music.get_playback_position()
		$secretmusic.stream = newsecretmusic
		$secretmusic.play(musicpos)
		$music.stream_paused = true
	else:
		if ($music.stream_paused):
			$music.stream_paused = false
		$secretmusic.stop()
	if (global.targetRoom == "rank_room"):
		$music.stop()
		$secretmusic.stop()
		
func _process(delta):
	if (secret):
		if (!$secretmusic.playing):
			var newsecretmusic = load("res://Music/" + secretmusic + ".ogg")
			var musicpos = $music.get_playback_position()
			$secretmusic.stream = newsecretmusic
			$secretmusic.play(musicpos)
		$music.stream_paused = true
	elif (!secret):
		if ($music.stream_paused):
			$music.stream_paused = false
		$secretmusic.stop()
	if (global.panic):
		var obj_player = utils.get_player()
		if (global.laps == 0 && music != "mu_pizzatime" && obj_player.character == "P"):
			music = "mu_pizzatime"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 0 && music != "mu_noiseescape" && obj_player.character == "N"):
			music = "mu_noiseescape"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 0 && music != "mu_peppermanescape" && obj_player.character == "M"):
			music = "mu_peppermanescape"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 0 && music != "mu_vigilanteescape" && obj_player.character == "V"):
			music = "mu_vigilanteescape"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 0 && music != "mu_pizzanoescape" && obj_player.character == "Z"):
			music = "mu_pizzanoescape"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 1 && music != "mu_lap" && obj_player.character == "P"):
			music = "mu_lap"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 1 && music != "mu_noiselap" && obj_player.character == "N"):
			music = "mu_noiselap"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 1 && music != "mu_peppermanlap" && obj_player.character == "M"):
			music = "mu_peppermanlap"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 1 && music != "mu_vigilantelap" && obj_player.character == "V"):
			music = "mu_vigilantelap"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()
		elif (global.laps == 1 && music != "mu_pizzanolap" && obj_player.character == "Z"):
			music = "mu_pizzanolap"
			var newmusic = load("res://Music/" + music + ".ogg")
			$music.stream = newmusic
			$music.play()

func _on_RestartMusicTimer_timeout():
	if (!$music.playing):
		$music.play()
