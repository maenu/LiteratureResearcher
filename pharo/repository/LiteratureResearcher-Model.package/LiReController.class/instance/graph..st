accessing
graph: anObject
	graph := anObject.
	view := graph asRoassalView.
	graph nodes do: [ :n | self registerCallbacksFor: n ].
	graph announcer
		when: LiReNodeAdded
		do: [ :e | 
			(e node isKindOf: LiReArticle)
				ifTrue: [ self registerCallbacksFor: e node ] ].
	graph announcer when: LiReEdgeAdded do: [ :e | self scheduleLayout ].
	graph announcer when: LiReEdgeRemoved do: [ :e | self scheduleLayout ].
	graph announcer when: LiReNodeAdded do: [ :e | self scheduleLayout ].
	graph announcer when: LiReNodeRemoved do: [ :e | self scheduleLayout ].
	self scheduleLayout