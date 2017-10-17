accessing
entity: anObject
	super entity: anObject.
	((LiReEdge allSubclasses select: [ :c | c canBecomeSource: anObject ])
		collect: [ :c | 
			self
				newTabOutgoingEdges: c
				with: (entity graph outgoingEdges: entity class: c) ])
		,
			((LiReEdge allSubclasses select: [ :c | c canBecomeTarget: anObject ])
				collect: [ :c | 
					self
						newTabIncomingEdges: c
						with: (entity graph incomingEdges: entity class: c) ])
		do: [ :t | tabManager addTab: t ]