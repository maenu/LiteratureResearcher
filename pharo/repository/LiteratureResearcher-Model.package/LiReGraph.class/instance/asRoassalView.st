converting
asRoassalView
	| view legendBuilder |
	view := RTView new.
	view attributeAt: #GlamourContext put: LiReRTInteractiveViewContext new.
	nodes do: [ :n | n addRoassalElementTo: view ].
	edges do: [ :e | e addRoassalElementTo: view ].
	legendBuilder := RTLegendBuilder new
		onDemand;
		view: view;
		addText: 'Node colors represent the state, i.e. how deep they have been investigated';
		yourself.
	LiReLabel allInstancesSorted do: [ :l | legendBuilder addColor: l asColor text: l asString ].
	legendBuilder build.
	view @ RTZoomableView.
	view @ RTDraggableView.
	announcer
		when: LiReEdgeAdded
		do: [ :e | 
			e edge isCollection
				ifTrue: [ e edge do: [ :ee | ee addRoassalElementTo: view ] ]
				ifFalse: [ e edge addRoassalElementTo: view ] ].
	announcer
		when: LiReEdgeRemoved
		do: [ :e | 
			e edge isCollection
				ifTrue: [ e edge do: [ :ee | (view edgeFromModel: ee) remove ] ]
				ifFalse: [ (view edgeFromModel: e edge) remove ] ].
	announcer
		when: LiReNodeAdded
		do: [ :e | 
			e node isCollection
				ifTrue: [ e node do: [ :ee | ee addRoassalElementTo: view ] ]
				ifFalse: [ e node addRoassalElementTo: view ] ].
	announcer
		when: LiReNodeRemoved
		do: [ :e | 
			e node isCollection
				ifTrue: [ e node do: [ :ee | (view elementFromModel: ee) remove ] ]
				ifFalse: [ (view elementFromModel: e node) remove ] ].
	^ view