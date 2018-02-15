instance creation
actionsWithController: aController repository: aFileReference tools: aDictionary
	| showArticle showAuthor searchOneBibtex searchOneClusterId searchManyByAny searchManyByAuthors searchManyCitations searchManyByTitle pdfLoad pdfImport pdfLink pdfOpen pdfMove |
	showArticle := LiReHyperlinkShowArticleAction controller: aController.
	showAuthor := LiReHyperlinkShowAuthorAction controller: aController.
	searchOneBibtex := LiReSearchOneBibtexAction controller: aController scholarPy: (aDictionary at: LiReScholarPy).
	searchOneClusterId := LiReSearchOneClusterIdAction controller: aController scholarPy: (aDictionary at: LiReScholarPy).
	searchManyByAny := LiReSearchManyByAnyAction controller: aController scholarPy: (aDictionary at: LiReScholarPy).
	searchManyByAuthors := LiReSearchManyByAuthorsAction controller: aController scholarPy: (aDictionary at: LiReScholarPy).
	searchManyByTitle := LiReSearchManyByTitleAction controller: aController scholarPy: (aDictionary at: LiReScholarPy).
	searchManyCitations := LiReSearchManyCitationsAction controller: aController scholarPy: (aDictionary at: LiReScholarPy) searchOneClusterId: searchOneClusterId.
	pdfLoad := LiRePdfLoadAction
		controller: aController
		repository: aFileReference
		pdfdbscrap: (aDictionary at: LiRePdfdbscrap)
		searchManyByTitle: searchManyByTitle.
	pdfImport := LiRePdfImportAction controller: aController repository: aFileReference cermine: (aDictionary at: LiReCermine).
	pdfLink := LiRePdfLinkAction controller: aController repository: aFileReference pdfLinker: (aDictionary at: LiRePdfLinker).
	pdfOpen := LiRePdfOpenAction controller: aController repository: aFileReference pdfOpen: (aDictionary at: LiRePdfOpen).
	pdfMove := LiRePdfMoveAction controller: aController repository: aFileReference.
	^ {(LiReSearchOneBibtexAction -> searchOneBibtex).
	(LiReSearchOneClusterIdAction -> searchOneClusterId).
	(LiReHyperlinkShowArticleAction -> showArticle).
	(LiReHyperlinkShowAuthorAction -> showAuthor).
	(LiReSearchManyByAnyAction -> searchManyByAny).
	(LiReSearchManyByAuthorsAction -> searchManyByAuthors).
	(LiReSearchManyByTitleAction -> searchManyByTitle).
	(LiReSearchManyCitationsAction -> searchManyCitations).
	(LiRePdfImportAction -> pdfImport).
	(LiRePdfLinkAction -> pdfLink).
	(LiRePdfLoadAction -> pdfLoad).
	(LiRePdfMoveAction -> pdfMove).
	(LiRePdfOpenAction -> pdfOpen)} asDictionary