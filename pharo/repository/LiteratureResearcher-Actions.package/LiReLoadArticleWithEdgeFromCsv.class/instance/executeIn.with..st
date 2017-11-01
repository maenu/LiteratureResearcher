target resize
executeIn: aDictionary with: aNode
	| article edge |
	article := super executeIn: aDictionary with: aNode.
	edge := self newEdgeWith: aDictionary source: article target: aNode.
	aNode graph edges add: edge