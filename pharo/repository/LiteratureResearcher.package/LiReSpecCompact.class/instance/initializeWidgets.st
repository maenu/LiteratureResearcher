initialization
initializeWidgets
	label := self newLabel.
	buttonRead := self newButton
		help: 'Read';
		icon: (Smalltalk ui icons iconNamed: #objects);
		yourself.
	buttonUpdate := self newButton
		help: 'Update';
		icon: (Smalltalk ui icons iconNamed: #edit);
		yourself.
	buttonDelete := self newButton
		help: 'Delete';
		icon: (Smalltalk ui icons iconNamed: #delete);
		yourself