initialization
initializeWidgets
	bibtex := self newBibtex.
	authors := self newAuthors.
	references := self newReferences.
	tabManager := self newTabManager.
	tabManager
		addTab:
			(self newTab
				model: bibtex;
				label: 'Bibtex';
				closeable: false;
				yourself).
	tabManager
		addTab:
			(self newTab
				model: authors;
				label: 'Authors';
				closeable: false;
				yourself).
	tabManager
		addTab:
			(self newTab
				model: references;
				label: 'References';
				closeable: false;
				yourself)