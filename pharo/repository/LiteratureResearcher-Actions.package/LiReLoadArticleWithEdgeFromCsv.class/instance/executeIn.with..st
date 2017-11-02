target resize
executeIn: aDictionary with: aNode
	| article edge |
	article := super executeIn: aDictionary with: aNode.
	edge := self newEdgeWith: aDictionary article: article other: aNode.
	aNode graph edges add: edge