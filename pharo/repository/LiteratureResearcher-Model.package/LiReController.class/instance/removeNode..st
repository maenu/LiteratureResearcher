removing
removeNode: aNode
	| node |
	node := view elementFromModel: aNode.
	node outgoingEdges , node incomingEdges do: [ :e | self removeEdge: e ].
	node remove