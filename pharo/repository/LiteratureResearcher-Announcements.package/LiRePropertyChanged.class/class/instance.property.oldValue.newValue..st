instance creation
instance: anObject property: aSymbol oldValue: anotherObject newValue: yetAnotherObject
	^ self new
		instance: anObject;
		property: aSymbol;
		oldValue: anotherObject;
		newValue: yetAnotherObject;
		yourself