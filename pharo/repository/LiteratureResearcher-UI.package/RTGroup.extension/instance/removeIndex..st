*LiteratureResearcher-UI
removeIndex: index
	| remove element result |
	remove := (1 to: self size) includes: index.
	remove
		ifTrue: [ element := self at: index ].
	result := super removeIndex: index.
	remove
		ifTrue: [ self elementFromModelCache keysAndValuesRemove: [ :k :v | v == element ] ].
	^ result