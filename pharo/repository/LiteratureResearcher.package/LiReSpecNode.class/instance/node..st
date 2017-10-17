accessing
node: anObject
	node := anObject.
	tabsEdges do: [ :t | tabManager removeTab: t ].
	tabsEdges
		addAll:
			((LiReEdge allSubclasses select: [ :c | c canBecomeSource: anObject ])
				collect: [ :c | self newTabOutgoingEdges: c with: (node graph outgoingEdges: node class: c) ]);
		addAll:
			((LiReEdge allSubclasses select: [ :c | c canBecomeTarget: anObject ])
				collect: [ :c | self newTabIncomingEdges: c with: (node graph incomingEdges: node class: c) ]).
	tabsEdges do: [ :t | tabManager addTab: t ]