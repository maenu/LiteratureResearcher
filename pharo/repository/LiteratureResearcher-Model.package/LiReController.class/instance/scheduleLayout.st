initialization
scheduleLayout
	scheduledLayout ifNotNil: [ scheduledLayout terminate ].
	scheduledLayout := [ 300 milliSeconds asDelay wait.
	scheduledLayout := nil.
	RTOptimizedForceBasedLayout new
		charge: -1000;
		on: view elements.
	view edges do: #pushBack ] fork