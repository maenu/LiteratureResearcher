as yet unclassified
loadNextPage
	| page |
	page := block value: cache size value: pageSize.
	page isEmpty
		ifTrue: [ atEnd := true ]
		ifFalse: [ cache addAll: page ]