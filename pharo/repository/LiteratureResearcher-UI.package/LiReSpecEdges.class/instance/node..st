accessing
node: aNode
	node := aNode.
	paginatorModel stream: (ReadStream on: ((node perform: edgesSelector with: edgeClass) sorted: [ :a :b | a order < b order ]))