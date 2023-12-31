extends Node2D

func _ready():
	if (!global.saveroom.has(global.targetRoom + name)):
		global.secretfound += 1
		for i in get_tree().get_nodes_in_group("obj_tv"):
			i.message = "" + str(global.secretfound) + " SECRETS DOWN OUT OF 6!"
			i.showtext = true
			i.resettimer.wait_time = 2.5
			i.resettimer.start()
		utils.playsound("SecretFound")
		global.saveroom.append(global.targetRoom + name)
