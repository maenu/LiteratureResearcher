as yet unclassified
loadNextPage
	| page |
	page := block value: cache size value: pageSize.
	page isEmpty
		ifTrue: [ complete := true ]
		ifFalse: [ cache addAll: page ]