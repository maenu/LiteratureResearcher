as yet unclassified
registerCallbacksForEdge: anEdge
	anEdge announcer when: LiReRequestSelect do: [ :r | self selectEdge: anEdge ]