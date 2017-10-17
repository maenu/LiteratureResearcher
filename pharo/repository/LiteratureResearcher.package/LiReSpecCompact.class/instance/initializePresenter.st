initialization
initializePresenter
	buttonRead action: [ self flag: 'TODO' ].
	buttonUpdate action: [ entity asWidget openWithSpec ].
	buttonDelete action: [ self flag: 'TODO' ]