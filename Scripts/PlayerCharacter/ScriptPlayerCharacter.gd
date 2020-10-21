extends KinematicBody

var playerVelocity = Vector3(0,0,0)
const PLAYERSPEED = 4
const ROTATESPEED = 5.5
var playerName = "Test Player"
var playerWeight = 0.0
var playerMaxWeight = 50
var playerHealth = 75
var playerMaxHealth = 100
var playerScore = 0
var deathState = false 

func _ready():
	pass

func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		playerVelocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		playerVelocity.x = PLAYERSPEED
		$MeshInstance.rotate_z(-deg2rad(ROTATESPEED))
	elif Input.is_action_pressed("ui_left"):
		playerVelocity.x = -PLAYERSPEED		
		$MeshInstance.rotate_z(deg2rad(ROTATESPEED))
	else:
		playerVelocity.x = lerp(playerVelocity.x,0,0.02)		
		
	if Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_up"):
		playerVelocity.z = 0
	elif Input.is_action_pressed("ui_down"):
		playerVelocity.z = PLAYERSPEED
		$MeshInstance.rotate_x(-deg2rad(-ROTATESPEED))
	elif Input.is_action_pressed("ui_up"):
		playerVelocity.z = -PLAYERSPEED
		$MeshInstance.rotate_x(-deg2rad(ROTATESPEED))
	else:
		playerVelocity.z = lerp(playerVelocity.z,0,0.02)
	
	print(playerVelocity)
	move_and_slide(playerVelocity)
		
