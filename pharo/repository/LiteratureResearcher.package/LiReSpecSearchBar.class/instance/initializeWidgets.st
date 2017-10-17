initialization
initializeWidgets
	text := self newTextInput.
	buttonSearch := self newButton
		help: 'Search';
		icon: (Smalltalk ui icons iconNamed: #glamorousSearch);
		yourself.
	buttonCreate := self newButton
		help: 'Create';
		icon: (Smalltalk ui icons iconNamed: #add);
		yourself