initialization
initializeWidgets
	searchText := self newTextInput
		autoAccept: true;
		yourself.
	searchButton := self newButton
		help: 'Search';
		icon: (Smalltalk ui icons iconNamed: #glamorousSearch);
		yourself.
	createButton := self newButton
		help: 'Create';
		icon: (Smalltalk ui icons iconNamed: #add);
		yourself.
	resultList := self instantiate: FastTableModel