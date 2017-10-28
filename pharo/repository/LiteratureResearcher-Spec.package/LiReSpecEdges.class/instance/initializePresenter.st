initialization
initializePresenter
	list
		items: ((node perform: edgesSelector with: edgeClass) sorted: [ :a :b | a order < b order ]);
		displayBlock: edgeDisplayBlock;
		menu: [ :m | 
			list selectedItem
				ifNil: [ m ]
				ifNotNil: [ :i | 
					m
						addAllMorphs: ((self newMenu: i) buildWithSpec: #popup) items;
						yourself ] ].
	search
		resultListDisplayBlock: [ :n | n label ];
		resultListSelectBlock: selectBlock;
		searchBlock: [ :t | node graph nodes select: [ :n | n class = (edgeClass perform: edgeEndClassSelector) and: [ n matches: t ] ] ];
		createFromResultBlock: [ :n | createEdgeBlock cull: n cull: edgeClass ];
		createFromSearchTextBlock: [ :s | 
			| n |
			n := (edgeClass perform: edgeOtherEndClassSelector) fromText: s graph: node graph.
			node graph nodes add: n.
			createEdgeBlock cull: n cull: edgeClass ]