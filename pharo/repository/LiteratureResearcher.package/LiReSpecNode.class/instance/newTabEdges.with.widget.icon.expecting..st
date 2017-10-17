instance creation
newTabEdges: anEdgeClass with: aCollection widget: aSelector icon: anIcon expecting: aNodeClass
	| tab |
	tab := self instantiate: LiReSpecEdges.
	tab list displayBlock: [ :edge | (edge perform: aSelector) buildWithSpec ].
	tab list items: aCollection.
	tab search search: [ :text | node graph nodes select: [ :n | n class = aNodeClass and: [ n matches: text ] ] ].
	tab search resultCreate: [ :n | self flag: 'TODO' ].
	tab search searchBar create: [ :text | self flag: 'TODO' ].
	^ self newTab
		model: tab;
		icon: anIcon;
		label: anEdgeClass label;
		closeable: false;
		yourself