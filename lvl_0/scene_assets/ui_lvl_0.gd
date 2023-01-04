extends Control

onready var nxt_btn = $"prompt_panel/next_button"
onready var first_panel = $familiarize_panel
onready var prompt_text = $"prompt_panel/main_text"

var filepath = "res://lvl_0/scene_assets/tutorial_text.json"
var json : JSONParseResult

enum panel_state {
	INTRO_STATE,
	FIRST_PANEL_STATE,
	END_STATE
}

var current_state = panel_state.INTRO_STATE

func _ready():
	var file_load = File.new()
	file_load.open(filepath, File.READ)
	json = JSON.parse( file_load.get_as_text() )
	first_panel.hide()
	prompt_text.text = json.result["0"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_next_button_pressed():
	if current_state == panel_state.INTRO_STATE:
		current_state = panel_state.FIRST_PANEL_STATE
		prompt_text.text = json.result["1"]
		first_panel.show()
	elif current_state  == panel_state.FIRST_PANEL_STATE:
		current_state = panel_state.END_STATE
	else:
		#throw error here
		pass