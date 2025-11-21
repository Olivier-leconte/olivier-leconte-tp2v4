extends Camera2D
class_name ControleCamera

@export var zoom_closed := Vector2(1.3, 1.3)  # Zoom rapproché
@export var zoom_open := Vector2(1.0, 1.0)    # Zoom éloigné
@export var zoom_duration := 0.4              # Durée de transition en secondes
