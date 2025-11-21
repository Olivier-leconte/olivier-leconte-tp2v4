extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var jump_sfx: AudioStreamPlayer = $jump_sfx


const SPEED = 120.0
const JUMP_FORCE = 170
const GRAVITY = 400


func respawn():
	self.global_position = Vector2(-21.0, -1.0)

	

func _physics_process(delta):
	# --- GRAVITÉ ---
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# --- MOUVEMENT HORIZONTAL ---
	var input_dir = Input.get_axis("gauche", "droite")
	velocity.x = input_dir * SPEED  # Toujours appliquer la vitesse
	if input_dir != 0:
		sprite.flip_h = (input_dir == -1)
		

	# --- SAUT ---
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = -JUMP_FORCE
		jump_sfx.play()
		

	# --- ANIMATION ---
	animation(input_dir)

	# --- APPEL OBLIGATOIRE ---
	move_and_slide()

func animation(direction):
	if is_on_floor():
		if direction == 0:
			sprite.play("idle")
		else:
			sprite.play("walk")
