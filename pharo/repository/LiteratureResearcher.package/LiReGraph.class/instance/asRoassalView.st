converting
asRoassalView
	| view legendBuilder |
	view := RTView new.
	view attributeAt: #GlamourContext put: LiReRTInteractiveViewContext new.
	view attributeAt: #preparedForDeselection put: true.
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
	self
		whenEdgeAddedDo: [ :e | 
			e edge addRoassalElementTo: view.
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	self
		whenEdgeRemovedDo: [ :e | 
			view removeEdge: (view edgeFromModel: e edge).
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	self
		whenNodeAddedDo: [ :e | 
			e node addRoassalElementTo: view.
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	self
		whenNodeRemovedDo: [ :e | 
			view removeElement: (view elementFromModel: e node).
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	^ view