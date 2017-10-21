accessing
entity: anObject
	super entity: anObject.
	self flag: 'TODO update edges when changed as well'.
	((LiReEdge allSubclasses select: [ :c | c canBecomeSource: anObject ]) collect: [ :c | self newTabOutgoingEdges: c ])
		, ((LiReEdge allSubclasses select: [ :c | c canBecomeTarget: anObject ]) collect: [ :c | self newTabIncomingEdges: c ])
		do: [ :t | tabManager addTab: t ]