extends Timer

var current_encounter = "Asteroid Belt"
var ENCOUNTER_LENGTH = 30

var seconds = ENCOUNTER_LENGTH
var cycle_length = 10
var cycle_count = 0

func begin_cycle():
	$EncounterTitle.show()
	update_encounter_title()
	# Start a new encounter's cycle, which lasts for 30 seconds unless stopped early
	seconds = ENCOUNTER_LENGTH
	self.start()

func end_EventCycleTimer():
	self.stop()
	
func update_encounter_title():
	$EncounterTitle.set_text(current_encounter + " : " + str(seconds) + " seconds")

func _on_EncounterManager_timeout():
	seconds -= 1
	update_encounter_title()
	if seconds == 0:
		self.stop()
	else:
		self.start()
		cycle_count += 1
