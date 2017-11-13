initialization
initializeWidgets
	textModel := self newTextInput
		autoAccept: true;
		yourself.
	buttonModel := self newButton
		label: 'Search';
		icon: (Smalltalk ui icons iconNamed: #glamorousSearch);
		yourself.
	paginatorModel := (self instantiate: LiReSpecPaginator)
		stream: (LiRePaginatedStream block: [ {} ]);
		yourself