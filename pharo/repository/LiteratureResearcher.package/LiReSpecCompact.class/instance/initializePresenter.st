initialization
initializePresenter
	buttonRead action: [ entity asWidget openWithSpec ].
	buttonUpdate action: [ entity asWidget openWithSpec ].
	buttonDelete action: [ entity asWidget openWithSpec ]