extends Node

# store app values
var data
# base values
var focus_time = 1800 # 60..5400
var short_break_time = 300 # 60..5400
var long_break_time = 900 # 60..5400
var rounds = 3 # 1..12
var state = "focus" # focus, short_break, long_break
var sound = 50 # 0..100

var gone_rounds = 1

func _ready():
	load_data()
	focus_time = data["focus_time"]
	short_break_time = data["short_break_time"]
	long_break_time = data["long_break_time"]
	rounds = data["rounds"]
	state = data["state"]
	sound = data["sound"]
	

# save data to file 
func save_data():
	var file = FileAccess.open("user://data.dat", FileAccess.WRITE)
	file.store_var(data)
	file.close()

# load data from file
func load_data():
	if FileAccess.file_exists("user://data.dat"):
		var file = FileAccess.open("user://data.dat", FileAccess.READ)
		data = file.get_var()
		file.close()
	else:
		data = {
		"focus_time" : focus_time,
		"short_break_time": short_break_time,
		"long_break_time": long_break_time,
		"rounds": rounds,
		"state": state,
		"sound": sound
		}
