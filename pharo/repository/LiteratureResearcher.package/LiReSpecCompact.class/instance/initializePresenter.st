initialization
initializePresenter
	buttonRead action: [ self onRead ].
	buttonUpdate action: [ entity asWidget openWithSpec ].
	buttonDelete action: [ self onDelete ]