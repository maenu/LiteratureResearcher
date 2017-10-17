initialization
initializePresenter
	super initializePresenter.
	tabNode bibtex acceptBlock: [ :s | node bibtex: (CZBibParser parse: s) ]