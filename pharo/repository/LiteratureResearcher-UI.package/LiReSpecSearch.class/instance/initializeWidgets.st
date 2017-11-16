initialization
initializeWidgets
	searchTextModel := self newTextInput
		autoAccept: true;
		yourself.
	searchButtonModel := self newButton
		help: 'Search';
		icon: (Smalltalk ui icons iconNamed: #glamorousSearch);
		yourself.
	createButtonModel := self newButton
		help: 'Create';
		icon: (Smalltalk ui icons iconNamed: #add);
		yourself.
	paginatorModel := self instantiate: LiReSpecPaginator