instance creation
controller: aController repository: aFileReference pdfdbscrap: aPdfdbscrap searchManyByTitle: aSearchManyByTitle
	^ (self controller: aController repository: aFileReference)
		repository: aFileReference;
		pdfdbscrap: aPdfdbscrap;
		searchManyByTitle: aSearchManyByTitle;
		yourself