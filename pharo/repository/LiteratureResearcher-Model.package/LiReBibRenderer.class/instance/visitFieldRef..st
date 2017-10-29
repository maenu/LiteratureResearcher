visiting
visitFieldRef: aFieldRef
	"TODO WTF!?"

	self
		text: aFieldRef fieldName;
		text: ' = '.
	aFieldRef fieldName = 'year'
		ifTrue: [ self
				text: (currentEntry at: aFieldRef fieldName) rawValue;
				text: ',';
				newline ]
		ifFalse: [ self
				text: '{';
				text: (currentEntry at: aFieldRef fieldName) rawValue;
				text: '},';
				newline ]