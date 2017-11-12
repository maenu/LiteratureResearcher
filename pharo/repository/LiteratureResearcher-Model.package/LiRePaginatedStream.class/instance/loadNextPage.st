as yet unclassified
loadNextPage
	| page |
	page := block cull: cache size cull: pageSize.
	page isEmpty
		ifTrue: [ complete := true ]
		ifFalse: [ cache addAll: page ]