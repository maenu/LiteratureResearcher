initialization
initializeWidgets
	tabManager := self newTabManager.
	tabManager addTab: self newTabArticle.
	tabManager addTab: self newTabHasWritten.
	tabManager addTab: self newTabReferences.
	tabManager addTab: self newTabMetadata