selecting
hideNode: aNode
	self assert: [ aNode hidden ].
	(((aNode incomingEdges select: #hidden) , (aNode outgoingEdges select: #hidden)
		collect: [ :e | view edgeFromModel: e ]) reject: #isNil)
		do: [ :e | 
			RTLabeled removeLabelFrom: e.
			e remove ].
	(view elementFromModel: aNode) ifNotNil: [ :e | e remove ]