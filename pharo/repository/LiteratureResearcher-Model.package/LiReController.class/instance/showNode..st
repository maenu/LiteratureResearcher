selecting
showNode: aNode
	self assert: [ aNode hidden not ].
	(view elementFromModel: aNode) ifNil: [ aNode addRoassalEntityTo: view ].
	((aNode incomingEdges reject: #hidden) , (aNode outgoingEdges reject: #hidden) select: [ :e | (view edgeFromModel: e) isNil ])
		do: [ :e | e addRoassalEntityTo: view ]