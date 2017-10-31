visiting
visitFieldRef: aFieldRef
	"TODO WTF!?"

	self
		text: aFieldRef fieldName;
		text: ' = {';
		text: (currentEntry at: aFieldRef fieldName) rawValue;
		text: '},';
		newline