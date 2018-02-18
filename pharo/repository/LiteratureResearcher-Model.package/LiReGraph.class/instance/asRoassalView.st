converting
asRoassalView
	| view nodesVisible legendBuilder |
	view := RTView new.
	view attributeAt: #GlamourContext put: LiReRTInteractiveViewContext new.
	(nodes reject: [ :n | n hidden ]) do: [ :n | n addRoassalEntityTo: view ].
	(edges reject: [ :e | e hidden ]) do: [ :e | e addRoassalEntityTo: view ].
	legendBuilder := RTLegendBuilder new
		onDemand;
		view: view;
		addText: 'Node colors represent the state, i.e. how deep they have been investigated';
		yourself.
	LiReLabel allInstancesSorted do: [ :l | legendBuilder addColor: l asColor text: l asString ].
	legendBuilder build.
	view @ RTZoomableView.
	view @ RTDraggableView.
	^ view