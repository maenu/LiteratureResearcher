converting
fromSimplification: aSimplification
	| nodesOrdered |
	nodesOrdered := (aSimplification at: #nodes)
		collect: [ :s | 
			((Smalltalk at: (s at: #class) asSymbol) fromSimplification: s)
				graph: self;
				yourself ].
	nodes
		removeAll;
		addAll: nodesOrdered.
	edges
		removeAll;
		addAll:
			((aSimplification at: #edges)
				collect: [ :s | 
					((Smalltalk at: (s at: #class) asSymbol) fromSimplification: s)
						graph: self;
						source: (nodesOrdered at: (s at: #source));
						target: (nodesOrdered at: (s at: #target));
						yourself ])