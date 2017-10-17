testing
canBecomeTarget: aNode
	^ aNode class = self targetClass or: [ aNode class inheritsFrom: self targetClass ]