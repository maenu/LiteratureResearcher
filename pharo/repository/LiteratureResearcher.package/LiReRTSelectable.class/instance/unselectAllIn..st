as yet unclassified
unselectAllIn: aView
	(aView elements , aView edges select: [ :e | self isSelected: e ]) do: [ :e | self unselect: e ].
	aView signalUpdate