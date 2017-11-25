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
		icon: #add asIcon;
		yourself.
	paginatorModel := self instantiate: LiReSpecPaginator