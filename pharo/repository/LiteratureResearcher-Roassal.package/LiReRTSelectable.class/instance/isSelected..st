testing
isSelected: anElement
	^ anElement attributeAt: #selected ifAbsent: [ false ]