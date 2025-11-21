extends AnimatedSprite2D

@onready var pièce_sfx: AudioStreamPlayer = $"../pièce_sfx"

func _ready() -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('player'):
		# Jouer le son
		pièce_sfx.play()
		
		# Supprimer la pièce
		queue_free()
