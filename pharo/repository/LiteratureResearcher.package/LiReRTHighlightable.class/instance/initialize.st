initialization
initialize
	super initialize.
	labelledInteraction := RTLabeled new
		color: (LiReState colorFromCss: '#4c4b1b');
		yourself.
	fromColor := LiReState colorFromCss: '#cecc65'.
	color := LiReState colorFromCss: '#c0be3f'.
	toColor := LiReState colorFromCss: '#999833'