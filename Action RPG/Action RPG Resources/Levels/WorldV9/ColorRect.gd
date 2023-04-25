extends ColorRect

export var dialogPath = ""
export(float) var textSpeed = 0.05

var dialog

var phraseNum = 0
var finished = false

func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Unable to retrieve dialog")
	nextPhrase()
	
func getDialog() -> Array:
	var f = File.new()
	assert(f.file_exists(dialogPath), "Unable to find dialog file in specified path")
	
	f.open(dialogPath, File.READ)
	var json = f.get_as_text()
	
	var output = parse_json(json)
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []
		
func nextPhrase() -> void:
	if phraseNum >= len(dialog):
		queue_free()
		return
	
	finished = false
	
	$Name.bbcode_text = dialog[phraseNum]["Name"]
	$Name.bbcode_text = dialog[phraseNum]["Text"]
	
	$Text.visable_characters = 0
	
	while $Text.visable_characters < len($Text.text):
		$Text.visable_characters += 1 # Sets text visability to scroll letter by letter
		
		$Timer.start()
		yield($Timer, "timeout") # Uses timer to decide how fast to scroll text
		
	finished = true
	phraseNum += 1
	return
		
