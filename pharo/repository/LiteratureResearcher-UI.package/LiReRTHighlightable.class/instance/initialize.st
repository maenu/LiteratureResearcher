initialization
initialize
	super initialize.
	labelledInteraction := RTLabeled new
		color: (Color fromString: '#4c4b1b');
		yourself.
	fromColor := Color fromString: '#cecc65'.
	color := Color fromString: '#c0be3f'.
	toColor := Color fromString: '#999833'