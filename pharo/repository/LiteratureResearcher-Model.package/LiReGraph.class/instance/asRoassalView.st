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
	^ view