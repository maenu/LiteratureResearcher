converting
asRoassalViewWithoutInstitutions
	| view |
	view := RTView new.
	(nodes reject: [ :n | n class = LiReInstitution ]) collect: [ :n | n addRoassalElementTo: view ].
	(edges reject: [ :e | e class sourceClass = LiReInstitution or: [ e class targetClass = LiReInstitution ] ])
		collect: [ :e | e addRoassalElementTo: view ].
	RTOptimizedForceBasedLayout new
		charge: -1000;
		on: view elements.
	view edges do: #pushBack.
	view @ RTSelectableView.
	view @ RTZoomableView.
	view @ RTDraggableView.
	^ view