converting
asRoassalView
	| view |
	view := RTView new.
	nodes collect: [ :n | n addRoassalElementTo: view ].
	edges collect: [ :e | e addRoassalElementTo: view ].
	RTOptimizedForceBasedLayout new
		charge: -1000;
		on: view elements.
	view edges do: #pushBack.
	view @ RTSelectableView.
	view @ RTZoomableView.
	view @ RTDraggableView.
	^ view