initialization
initializeWidgets
	text := self newTextInput.
	button := self newButton
		help: 'Search';
		icon: (self iconNamed: #glamorousSearch);
		yourself