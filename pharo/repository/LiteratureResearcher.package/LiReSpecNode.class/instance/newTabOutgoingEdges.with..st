instance creation
newTabOutgoingEdges: aClass with: aCollection
	^ self
		newTabEdges: aClass
		with: aCollection
		widget: #asCompactSourceWidget
		icon: (Smalltalk ui icons iconNamed: #forward)
		expecting: aClass sourceClass