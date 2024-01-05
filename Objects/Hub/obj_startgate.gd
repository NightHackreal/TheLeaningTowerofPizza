extends Area2D

export(String) var targetDoor = "A"
export(String) var targetLevel = "testroom"
export(String) var targetRoom = "testroom_1"

var highscore = 0
var secretcount = 0
var toppin = [false, false, false, false, false]

func loadleveldata():
	var SaveManager = ConfigFile.new()
	var SaveData = SaveManager.load("user://saveData.ini")
	if SaveData != OK:
		return
	highscore = SaveManager.get_value("Highscore", targetLevel, 0)
	secretcount = SaveManager.get_value("Secret", targetLevel, 0)
	toppin[0] = SaveManager.get_value("Toppin", (targetLevel + "1"), false)
	toppin[1] = SaveManager.get_value("Toppin", (targetLevel + "2"), false)
	toppin[2] = SaveManager.get_value("Toppin", (targetLevel + "3"), false)
	toppin[3] = SaveManager.get_value("Toppin", (targetLevel + "4"), false)
	toppin[4] = SaveManager.get_value("Toppin", (targetLevel + "5"), false)

func _ready():
	$Sprite.playing = true
	loadleveldata()
	
func _process(delta):
	var obj_player = utils.get_player()
	if (overlaps_body(obj_player)):
		$Sprite.speed_scale = 0.35
		$ScoreLabel.visible = true
		$SecretLabel.visible = true
	else:
		$Sprite.speed_scale = 0
		$Sprite.frame = 0
		$ScoreLabel.visible = false
		$SecretLabel.visible = false
	if (overlaps_body(obj_player)):
		$ScoreLabel.text = str(highscore)
		$SecretLabel.text = str(secretcount) + " OF 6 SECRET"
		match targetLevel:
			"testroom":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "TEST LEVEL"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"ancient":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "YE OLDE LEFTOVERSE"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"ravine":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "30 FEET UNDERGROUND"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"castle":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "CRUST CASTLE"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"dragonlair":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "DRAGON'S LAIR"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"water":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "HYDRO HYJINKS"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"oven":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "OREGANO OVEN"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"kungfu":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "HAAAIIIYYYAAAHHH!!!"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"crashedufo":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "UNIDENTIFIED FLYING OLIVE"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"heaven":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "HEAVENLY SKYSCAPES"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"golf":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "SWISSSHOT COURSE"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"canadianwinter":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "OH CANADA!"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"kitchen":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "KALAMITEE KITCHEN"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"freezer":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "NOISERATOR-REFRIGERATOR"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"factory":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "MECHANICAL MADNESS"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"lightsout":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "YOU BRING A LIGHT?"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"fnaf":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "5:59 A.M."
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"top":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "THE LIVING TOWER OF PIZZA"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"exit":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "THE CRUMBLING TOWER OF PIZZA"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"entrance":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "JOHN GUTTER"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"medieval":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "PIZZASCAPE"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"ruin":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "THE ANCIENT CHEESE"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
			"dungeon":
				for obj in get_tree().get_nodes_in_group("obj_tv"):
					obj.message = "BLOODSAUCE DUNGEON"
					obj.showtext = true
					obj.resettimer.wait_time = 0.03
					obj.resettimer.start()
		if (Input.is_action_pressed("key_up") && obj_player.is_on_floor() && (obj_player.state == global.states.normal || obj_player.state == global.states.mach1 || obj_player.state == global.states.mach2 || obj_player.state == global.states.mach3) && !utils.instance_exists("obj_fadeout") && obj_player.state != global.states.victory && obj_player.state != global.states.comingoutdoor):
			for i in get_tree().get_nodes_in_group("obj_music"):
				i.musicnode.stop()
			obj_player.movespeed = 0
			obj_player.velocity.x = 0
			obj_player.backtohubstartx = obj_player.position.x
			obj_player.backtohubstarty = obj_player.position.y
			obj_player.backtohubroom = global.targetRoom
			obj_player.mach2 = 0
			for i in get_tree().get_nodes_in_group("obj_camera"):
				i.chargecamera = 0
			obj_player.state = global.states.victory
			obj_player.set_animation("entergate")
		if (obj_player.is_last_frame() && obj_player.state == global.states.victory):
			obj_player.targetLevel = targetLevel
			obj_player.targetRoom = targetRoom
			global.targetDoor = targetDoor
			global.roomtorestart = targetRoom
			global.leveltorestart = targetLevel
			if (!utils.instance_exists("obj_fadeout")):
				utils.instance_create(utils.get_gamenode().global_position.x, utils.get_gamenode().global_position.y, "res://Objects/Visuals/obj_fadeout.tscn")

func _on_obj_startgate_body_entered(body):
	if body is obj_player:
		utils.get_player().indoor = true

func _on_obj_startgate_body_exited(body):
	if body is obj_player:
		utils.get_player().indoor = false
