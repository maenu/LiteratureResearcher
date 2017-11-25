initialization
initializeWidgets
	textModel := self newTextInput
		autoAccept: true;
		yourself.
	buttonModel := self newButton
		label: 'Search';
		icon: #glamorousSearch asIcon;
		yourself.
	paginatorModel := self instantiate: LiReSpecPaginator