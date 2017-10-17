testing
canBecomeSource: aNode
	^ aNode class = self sourceClass or: [ aNode class inheritsFrom: self sourceClass ]