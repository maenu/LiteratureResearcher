initialization
initializeWidgets
	paginatorModel := self instantiate: LiReSpecPaginator.
	addDropListModel := self newDropList
		items: LiReLabel allInstancesSorted;
		setSelectedIndex: 1;
		iconHolder: [ :s | s asIcon ];
		displayBlock: [ :s | s asString ];
		yourself.
	addButtonModel := self newButton
		help: 'Add';
		icon: (Smalltalk ui icons iconNamed: #add);
		yourself.
	createTextModel := self newTextInput
		autoAccept: true;
		yourself.
	createColorModel := self newColorChooser.
	createButtonModel := self newButton
		help: 'Create';
		icon: (Smalltalk ui icons iconNamed: #add);
		yourself