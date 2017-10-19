converting
asRoassalView
	| view |
	view := RTView new.
	nodes collect: [ :n | n addRoassalElementTo: view ].
	edges collect: [ :e | e addRoassalElementTo: view ].
	RTOptimizedForceBasedLayout new
		charge: -1000;
		on: view elements.
	RTLegendBuilder new
		onDemand;
		view: view;
		addText: 'Each box is a class, belonging to the Collection class hierarchy';
		addColor: Color green text: 'Class with less than 1000 lines of code';
		addColor: Color red text: 'Class with more than 1000 lines of code';
		build.
	view edges do: #pushBack.
	view @ RTSelectableView.
	view @ RTZoomableView.
	view @ RTDraggableView.
	^ view