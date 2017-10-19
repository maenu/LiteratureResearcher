converting
asRoassalViewWithoutInstitutions
	| view legendBuilder |
	view := RTView new.
	(nodes reject: [ :n | n class = LiReInstitution ]) collect: [ :n | n addRoassalElementTo: view ].
	(edges reject: [ :e | e class sourceClass = LiReInstitution or: [ e class targetClass = LiReInstitution ] ]) collect: [ :e | e addRoassalElementTo: view ].
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
	view @ RTSelectableView.
	view @ RTZoomableView.
	view @ RTDraggableView.
	^ view