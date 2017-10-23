converting
asRoassalView
	| view legendBuilder |
	view := RTView new.
	view attributeAt: #GlamourContext put: LiReRTInteractiveViewContext new.
	nodes do: [ :n | n addRoassalElementTo: view ].
	edges do: [ :e | e addRoassalElementTo: view ].
	RTOptimizedForceBasedLayout new
		charge: -1000;
		on: view elements.
	legendBuilder := RTLegendBuilder new
		onDemand;
		view: view;
		addText: 'Node colors represent the state, i.e. how deep they have been investigated';
		yourself.
	LiReState states do: [ :s | legendBuilder addColor: s color text: s label ].
	legendBuilder build.
	view edges do: #pushBack.
	view @ RTZoomableView.
	view @ RTDraggableView.
	view elements , view edges do: [ :e | e @ LiReRTHilightable ].
	self whenEdgeAddedDo: [ view signalUpdate ].
	self whenEdgeRemovedDo: [ view signalUpdate ].
	self whenNodeAddedDo: [ view signalUpdate ].
	self whenNodeRemovedDo: [ view signalUpdate ].
	^ view