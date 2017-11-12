initialization
initializePresenter
	backModel
		action: [ start := 0 max: start - size.
			self invalidate ].
	forwardModel
		action: [ start := start + size.
			self invalidate ]