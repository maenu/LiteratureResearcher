initialization
initializeWidgets
	listModel := self instantiate: LiReFastTableModel.
	backModel := self newButton
		icon: (Smalltalk ui theme icons iconNamed: #back);
		yourself.
	numberModel := self newLabel.
	forwardModel := self newButton
		icon: (Smalltalk ui theme icons iconNamed: #forward);
		yourself