extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
var last_dir: Vector2 = Vector2.RIGHT

func _physics_process(delta: float) -> void:
	
	movement()
	process_animations()
	move_and_slide()
	
	
	
	
# ____ MOVEMENT AND ANIMATIONS ____
func movement() -> void:
	
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		last_dir = direction
	else:
		velocity = Vector2.ZERO
	
	
	
func process_animations() ->void:
	if velocity != Vector2.ZERO:
		play_animatoons("", last_dir)
	else:
		play_animatoons("use", last_dir)
func play_animatoons(prefix: String, dir: Vector2) -> void:
	#idle is temp animation
	#run right animation
	if dir.x != 0:
		animated_sprite_2d.flip_h = false
		animated_sprite_2d.play(prefix + "idle")
	#run down animation
	elif dir.y > 0:
		animated_sprite_2d.play(prefix + "idle")
	#run up animation
	elif dir.y < 0:
		animated_sprite_2d.play(prefix + "idle")
	#true idle animation
	elif dir.x == 0 and dir.y == 0:
		animated_sprite_2d.play(prefix)
		
