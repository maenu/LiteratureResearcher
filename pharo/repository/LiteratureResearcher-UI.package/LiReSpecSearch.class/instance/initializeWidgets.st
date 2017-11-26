initialization
initializeWidgets
	searchTextModel := self newTextInput
		autoAccept: true;
		yourself.
	searchButtonModel := self newButton
		help: 'Search';
		icon: #glamorousSearch asIcon;
		yourself.
	createButtonModel := self newButton
		help: 'Create';
		icon: #add asIcon;
		yourself.
	paginatorModel := self instantiate: LiReSpecPaginator