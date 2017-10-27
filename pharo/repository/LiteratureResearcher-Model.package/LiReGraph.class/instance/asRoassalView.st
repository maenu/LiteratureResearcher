converting
asRoassalView
	| view legendBuilder |
	view := RTView new.
	"view attributeAt: #GlamourContext put: LiReRTInteractiveViewContext new."
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
	announcer
		when: LiReEdgeAdded
		do: [ :e | 
			e edge addRoassalElementTo: view.
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	announcer
		when: LiReEdgeRemoved
		do: [ :e | 
			view removeEdge: (view edgeFromModel: e edge).
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	announcer
		when: LiReNodeAdded
		do: [ :e | 
			e node addRoassalElementTo: view.
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	announcer
		when: LiReNodeRemoved
		do: [ :e | 
			view removeElement: (view elementFromModel: e node).
			RTOptimizedForceBasedLayout new
				charge: -1000;
				on: view elements ].
	^ view