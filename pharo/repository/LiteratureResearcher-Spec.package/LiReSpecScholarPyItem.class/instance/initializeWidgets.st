initialization
initializeWidgets
	titleLabel := self newLabel
		label: 'Title';
		yourself.
	titleModel := self newText.
	yearLabel := self newLabel
		label: 'Year';
		yourself.
	yearModel := self newText.
	citationsLabel := self newLabel
		label: 'Citations';
		yourself.
	citationsModel := self newText.
	excerptLabel := self newLabel
		label: 'Excerpt';
		yourself.
	excerptModel := self newText