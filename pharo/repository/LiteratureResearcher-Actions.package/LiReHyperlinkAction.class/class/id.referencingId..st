instance creation
id: aString referencingId: anotherString
	^ self new
		id: aString;
		referencingId: anotherString;
		yourself