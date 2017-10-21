initialization
initializeWidgets
	searchText := self newTextInput.
	searchButton := self newButton
		help: 'Search';
		icon: (Smalltalk ui icons iconNamed: #glamorousSearch);
		yourself.
	createButton := self newButton
		help: 'Create';
		icon: (Smalltalk ui icons iconNamed: #add);
		yourself.
	resultList := self instantiate: FastTableModel