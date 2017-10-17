initialization
initializePresenter
	super initializePresenter.
	tabNode name acceptBlock: [ :s | node name: s ].
	tabNode country acceptBlock: [ :s | node country: s ]