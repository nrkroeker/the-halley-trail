extends Timer

signal win_game

var encounters = ["Asteroid Belt", "Nothing"]

var current_encounter = "Asteroid Belt"
var ENCOUNTER_LENGTH = 10

var seconds = ENCOUNTER_LENGTH
var cycle_length = 10
var cycle_count = 0

func begin_cycle():
	$EncounterTitle.show()
	update_encounter_title()
	start_random_encounter()
	# Start a new encounter's cycle, which lasts for 30 seconds unless stopped early
	seconds = ENCOUNTER_LENGTH
	self.start()

func end_cycle():
	self.stop()
	end_encounter()

func end_EventCycleTimer():
	self.stop()
	
func update_encounter_title():
	$EncounterTitle.set_text(current_encounter + " : " + str(seconds) + " seconds")

func _on_EncounterManager_timeout():
	seconds -= 1
	update_encounter_title()
	if seconds == 0:
		self.stop()
		end_encounter()
		cycle_count += 1
		if cycle_count == 2:
			$EncounterTitle.hide()
			emit_signal("win_game")
		else:
			begin_cycle()
	else:
		self.start()
		
func start_random_encounter():
	$EncounterAlert.show()
	$AlertTimer.start()
	#$MeteorSpawner.begin()
	
func end_encounter():
	match current_encounter:
		"Asteroid Belt":
			$MeteorSpawner.end()


func _on_AlertTimer_timeout():
	$EncounterAlert.hide()
	$MeteorSpawner.begin()
