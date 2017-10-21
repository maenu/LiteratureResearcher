initialization
initializePresenter
	list
		items: (node perform: edgesSelector with: edgeClass);
		displayBlock: edgeDisplayBlock;
		menu: [ :m | 
			list selectedItem
				ifNil: [ m ]
				ifNotNil: [ | menu |
					menu := MenuModel new.
					menu
						addGroup: [ :group | 
							group
								addItem: [ :item | 
									item
										name: 'Read';
										action: [ self flag: 'TODO open in graph' ] ];
								addItem: [ :item | 
									item
										name: 'Update';
										action: [ list selectedItem asWidget openWithSpec ] ];
								addItem: [ :item | 
									item
										name: 'Delete';
										action: [ list selectedItem graph edges remove: list selectedItem ] ] ].
					m
						addAllMorphs: (menu buildWithSpec: #popup) items;
						yourself ] ].
	search
		resultListDisplayBock: [ :n | n label ];
		searchBlock: [ :t | node graph nodes select: [ :n | n class = (edgeClass perform: edgeEndClassSelector) and: [ n matches: t ] ] ];
		createFromResultBlock: [ :n | createEdgeBlock cull: n cull: edgeClass ];
		readFromResultBlock: [ :n | self flag: 'TODO open in graph' ];
		updateFromResultBlock: [ :n | n asWidget openWithSpec ];
		createFromSearchTextBlock: [ :s | 
			| n |
			n := (edgeClass perform: edgeEndClassSelector) fromText: s graph: node graph.
			node graph nodes add: n.
			createEdgeBlock cull: n cull: edgeClass ]