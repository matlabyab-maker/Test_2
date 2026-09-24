extends Node3D

var speed := 4.0

@onready var player: MeshInstance3D = $Player
@onready var target: MeshInstance3D = $Target

func _process(delta: float) -> void:
    var direction := Vector3.ZERO
    direction.x = Input.get_axis("move_left", "move_right")
    direction.z = Input.get_axis("move_forward", "move_back")
    if direction.length() > 0.0:
        direction = direction.normalized()
        player.position += direction * speed * delta
    if player.position.distance_to(target.position) < 1.0:
        target.position = Vector3(randf_range(-7.0, 7.0), 0.5, randf_range(-7.0, 2.0))
