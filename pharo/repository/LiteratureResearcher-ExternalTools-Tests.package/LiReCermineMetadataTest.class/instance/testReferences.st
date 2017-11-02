tests
testReferences
	| references |
	references := metadata references.
	self
		assert: (references collect: [ :reference | reference at: #key ])
		equals: ((1 to: 35) collect: [ :i | '[' , i asString , ']' ]) asOrderedCollection