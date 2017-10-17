initialization
initializePresenter
	super initializePresenter.
	tabNode name acceptBlock: [ :s | node name: s ].
	tabNode email acceptBlock: [ :s | node email: s ]