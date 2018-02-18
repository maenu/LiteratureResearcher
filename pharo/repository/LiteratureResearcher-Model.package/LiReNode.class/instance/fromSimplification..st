converting
fromSimplification: aSimplification
	labels removeAll.
	labels addAll: ((aSimplification at: #labels) collect: [ :s | (Smalltalk at: (s at: #class) asSymbol) fromSimplification: s ]).
	self hidden: (aSimplification at: #hidden)