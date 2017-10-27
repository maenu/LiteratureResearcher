initialization
initializeWidgets
	searchButton := self newButton
		label: 'Search';
		icon: (Smalltalk ui icons iconNamed: #glamorousSearch);
		yourself.
	list := self instantiate: FastTableModel.
	item := LiReSpecScholarPyItem item: Dictionary new