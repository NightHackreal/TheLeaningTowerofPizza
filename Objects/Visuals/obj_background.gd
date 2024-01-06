tool
extends Node2D

export(StreamTexture) var Layer1
export(StreamTexture) var Layer2
export(StreamTexture) var Layer3
export(StreamTexture) var LayerGround1
export(StreamTexture) var LayerGround2
export(StreamTexture) var LayerSky
export(StreamTexture) var LayerSky2
export(StreamTexture) var LayerH1
export(StreamTexture) var LayerScroll
export(int) var Layer1_order = -1000
export(int) var Layer2_order = -1000
export(int) var Layer3_order = -1000
export(int) var LayerGround1_order = -1000
export(int) var LayerGround2_order = -1000
export(int) var LayerSky_order = -1000
export(int) var LayerSky2_order = -1000
export(int) var LayerH1_order = -1000
export(int) var LayerScroll_order = -1000
# Default speed used for the secret background
export(int) var LayerScroll_XSpeed = 50
export(int) var LayerScroll_YSpeed = 50

func _process(delta):
	$Background/ParallaxLayer/Sprite.texture = Layer1
	$Background2/ParallaxLayer/Sprite.texture = Layer2
	$Background3/ParallaxLayer/Sprite.texture = Layer3
	$BackgroundGround1/ParallaxLayer/Sprite.texture = LayerGround1
	$BackgroundGround2/ParallaxLayer/Sprite.texture = LayerGround2
	$BackgroundSky/ParallaxLayer/Sprite.texture = LayerSky
	$BackgroundSky2/ParallaxLayer/Sprite.texture = LayerSky2
	$BackgroundH1/ParallaxLayer/Sprite.texture = LayerH1
	$BackgroundScroll/ParallaxLayer/Sprite.texture = LayerScroll
	
	$Background.layer = Layer1_order
	$Background2.layer = Layer2_order
	$Background3.layer = Layer3_order
	$BackgroundGround1.layer = LayerGround1_order
	$BackgroundGround2.layer = LayerGround2_order
	$BackgroundSky.layer = LayerSky_order
	$BackgroundSky2.layer = LayerSky2_order
	$BackgroundH1.layer = LayerH1_order
	$BackgroundScroll.layer = LayerScroll_order
	
	$BackgroundScroll/ParallaxLayer/Sprite.material.set_shader_param("motion", Vector2(float(LayerScroll_XSpeed), float(LayerScroll_YSpeed)))
	
	if (Layer1 != null):
		$Background/ParallaxLayer/Sprite.region_rect.size.x = $Background/ParallaxLayer/Sprite.texture.get_width() * 4
		$Background/ParallaxLayer/Sprite.region_rect.size.y = $Background/ParallaxLayer/Sprite.texture.get_height() * 4
		$Background/ParallaxLayer.motion_mirroring.x = $Background/ParallaxLayer/Sprite.texture.get_width() * 4
		$Background/ParallaxLayer.motion_mirroring.y = $Background/ParallaxLayer/Sprite.texture.get_height() * 4
	
	if (Layer2 != null):
		$Background2/ParallaxLayer/Sprite.region_rect.size.x = $Background2/ParallaxLayer/Sprite.texture.get_width() * 4
		$Background2/ParallaxLayer/Sprite.region_rect.size.y = $Background2/ParallaxLayer/Sprite.texture.get_height() * 4
		$Background2/ParallaxLayer.motion_mirroring.x = $Background2/ParallaxLayer/Sprite.texture.get_width() * 4
		$Background2/ParallaxLayer.motion_mirroring.y = $Background2/ParallaxLayer/Sprite.texture.get_height() * 4
	
	if (Layer3 != null):
		$Background3/ParallaxLayer/Sprite.region_rect.size.x = $Background3/ParallaxLayer/Sprite.texture.get_width() * 4
		$Background3/ParallaxLayer/Sprite.region_rect.size.y = $Background3/ParallaxLayer/Sprite.texture.get_height() * 4
		$Background3/ParallaxLayer.motion_mirroring.x = $Background3/ParallaxLayer/Sprite.texture.get_width() * 4
		$Background3/ParallaxLayer.motion_mirroring.y = $Background3/ParallaxLayer/Sprite.texture.get_height() * 4
	
	if (LayerGround1 != null):
		$BackgroundGround1/ParallaxLayer/Sprite.region_rect.size.x = $BackgroundGround1/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundGround1/ParallaxLayer/Sprite.region_rect.size.y = $BackgroundGround1/ParallaxLayer/Sprite.texture.get_height() * 4
		$BackgroundGround1/ParallaxLayer.motion_mirroring.x = $BackgroundGround1/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundGround1/ParallaxLayer.motion_mirroring.y = $BackgroundGround1/ParallaxLayer/Sprite.texture.get_height() * 4
	
	if (LayerGround2 != null):
		$BackgroundGround2/ParallaxLayer/Sprite.region_rect.size.x = $BackgroundGround2/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundGround2/ParallaxLayer/Sprite.region_rect.size.y = $BackgroundGround2/ParallaxLayer/Sprite.texture.get_height() * 4
		$BackgroundGround2/ParallaxLayer.motion_mirroring.x = $BackgroundGround2/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundGround2/ParallaxLayer.motion_mirroring.y = $BackgroundGround2/ParallaxLayer/Sprite.texture.get_height() * 4
	
	if (LayerSky != null):
		$BackgroundSky/ParallaxLayer/Sprite.region_rect.size.x = $BackgroundSky/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundSky/ParallaxLayer/Sprite.region_rect.size.y = $BackgroundSky/ParallaxLayer/Sprite.texture.get_height() * 4
		$BackgroundSky/ParallaxLayer.motion_mirroring.x = $BackgroundSky/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundSky/ParallaxLayer.motion_mirroring.y = $BackgroundSky/ParallaxLayer/Sprite.texture.get_height() * 4
	
	if (LayerSky2 != null):
		$BackgroundSky2/ParallaxLayer/Sprite.region_rect.size.x = $BackgroundSky2/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundSky2/ParallaxLayer/Sprite.region_rect.size.y = $BackgroundSky2/ParallaxLayer/Sprite.texture.get_height() * 4
		$BackgroundSky2/ParallaxLayer.motion_mirroring.x = $BackgroundSky2/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundSky2/ParallaxLayer.motion_mirroring.y = $BackgroundSky2/ParallaxLayer/Sprite.texture.get_height() * 4
	
	if (LayerH1 != null):
		$BackgroundH1/ParallaxLayer/Sprite.region_rect.size.x = $BackgroundH1/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundH1/ParallaxLayer/Sprite.region_rect.size.y = $BackgroundH1/ParallaxLayer/Sprite.texture.get_height() * 4
		$BackgroundH1/ParallaxLayer.motion_mirroring.x = $BackgroundH1/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundH1/ParallaxLayer.motion_mirroring.y = $BackgroundH1/ParallaxLayer/Sprite.texture.get_height() * 4
		
	if (LayerScroll != null):
		$BackgroundScroll/ParallaxLayer/Sprite.region_rect.size.x = $BackgroundScroll/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundScroll/ParallaxLayer/Sprite.region_rect.size.y = $BackgroundScroll/ParallaxLayer/Sprite.texture.get_height() * 4
		$BackgroundScroll/ParallaxLayer.motion_mirroring.x = $BackgroundScroll/ParallaxLayer/Sprite.texture.get_width() * 4
		$BackgroundScroll/ParallaxLayer.motion_mirroring.y = $BackgroundScroll/ParallaxLayer/Sprite.texture.get_height() * 4
