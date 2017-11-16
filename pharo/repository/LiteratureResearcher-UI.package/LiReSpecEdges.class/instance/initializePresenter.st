initialization
initializePresenter
	paginatorModel
		menuModelBlock: [ :e | 
			| menu |
			menu := MenuModel new.
			menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							mi
								name: 'Select in graph';
								action: [ e graph announcer announce: (LiReRequestSelectEdge entity: e) ] ] ].
			menu ].
	paginatorModel listModel
		displayBlock: [ :e | edgeDisplayBlock cull: e ];
		icons: [ :e | edgeIconBlock cull: e ].
	searchModel paginatorModel
		menuModelBlock: [ :n | 
			| menu |
			menu := MenuModel new.
			menu
				addGroup: [ :group | 
					group
						addItem: [ :mi | 
							mi
								name: 'Select in graph';
								action: [ n graph announcer announce: (LiReRequestSelectNode entity: n) ] ];
						addItem: [ :mi | 
							mi
								name: 'Create edge';
								action: [ edgeCreateBlock cull: n cull: edgeClass ] ] ].
			menu ].
	searchModel paginatorModel listModel
		displayBlock: [ :n | n label ];
		icons: [ :n | n state icon ].
	searchModel
		createBlock: [ :s | 
			| n |
			n := (edgeOtherEndClassBlock cull: edgeClass) fromText: s graph: node graph.
			node graph nodes add: n.
			edgeCreateBlock cull: n cull: edgeClass ];
		searchBlock: [ :s | ReadStream on: (node graph nodes select: [ :n | n class = (edgeClass perform: edgeEndClassBlock) and: [ n matches: s ] ]) ]