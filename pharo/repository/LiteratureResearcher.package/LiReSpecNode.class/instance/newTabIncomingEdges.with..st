instance creation
newTabIncomingEdges: aClass with: aCollection
	^ self
		newTabEdges: aClass
		with: aCollection
		widget: #asCompactTargetWidget
		icon: (Smalltalk ui icons iconNamed: #back)
		expecting: aClass sourceClass