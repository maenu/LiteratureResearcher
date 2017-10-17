initialization
initializePresenter
	bibtex acceptBlock: [ :s | article bibtex: (CZBibParser parse: s) ].
	authors list displayBlock: [ :edge | edge asCompactSourceWidget buildWithSpec ].
	authors search
		search:
			[ :text | (graph nodes select: [ :node | node class = LiReAuthor and: [ node name asLowercase includesSubstring: text asLowercase ] ]) collect: #asCompactWidget ].
	authors search resultCreate: [ :item | Halt now ].
	authors search searchBar create: [ :text | Halt now ].
	references list displayBlock: [ :edge | edge asCompactTargetWidget buildWithSpec ].
	references search
		search: [ :text | 
			(graph nodes select: [ :node | node class = LiReArticle and: [ (node bibtex at: #title) value asLowercase includesSubstring: text asLowercase ] ])
				collect: #asCompactWidget ].
	references search resultCreate: [ :item | Halt now ].
	references search searchBar create: [ :text | Halt now ]