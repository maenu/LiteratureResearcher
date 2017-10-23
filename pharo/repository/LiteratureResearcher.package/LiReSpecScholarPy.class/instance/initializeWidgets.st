initialization
initializeWidgets
	searchButton := self newButton
		label: 'Search';
		icon: (Smalltalk ui icons iconNamed: #glamorousSearch);
		yourself.
	list := self instantiate: FastTableModel.
	itemPlaceholder := self newLabel
		label: 'Select item in list';
		yourself.
	item := itemPlaceholder