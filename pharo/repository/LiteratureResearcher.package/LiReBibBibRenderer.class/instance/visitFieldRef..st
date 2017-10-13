visiting
visitFieldRef: aFieldRef
	"TODO WTF!?"

	self
		text: aFieldRef fieldName;
		text: ' = '.
	aFieldRef fieldName = 'year'
		ifFalse: [ aFieldRef fieldName = 'clusterId'
				ifFalse: [ self
						text: '{';
						text: (currentEntry at: aFieldRef fieldName) rawValue;
						text: '},';
						newline ]
				ifTrue: [ self
						text: '{';
						text: (currentEntry at: aFieldRef fieldName) rawValue;
						text: '}';
						newline ] ]
		ifTrue: [ self
				text: (currentEntry at: aFieldRef fieldName) rawValue;
				text: ',';
				newline ]