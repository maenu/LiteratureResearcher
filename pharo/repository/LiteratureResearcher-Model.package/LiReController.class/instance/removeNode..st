removing
removeNode: aNode
	(view elementFromModel: aNode)
		ifNotNil: [ :n | 
			n outgoingEdges , n incomingEdges do: [ :e | self removeEdge: e ].
			n remove ]