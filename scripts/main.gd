extends Node

@export var mob_scene: PackedScene


func _on_mob_timer_timeout() -> void:
	var mob_spawn_location = get_node("SpawnPath/SpawnLocation")
	mob_spawn_location.progress_ratio = randf()

	var mob = mob_scene.instantiate()
	var player_position = $Player.position
	mob.initialise(mob_spawn_location.position, player_position)

	add_child(mob)

	mob.squashed.connect($UserInterface/ScoreLabel.on_mob_squashed.bind())


func _on_player_hit() -> void:
	$MobTimer.stop()
