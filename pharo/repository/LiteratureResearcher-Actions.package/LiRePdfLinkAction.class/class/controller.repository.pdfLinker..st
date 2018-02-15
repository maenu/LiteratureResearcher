instance creation
controller: aController repository: aFileReference pdfLinker: aPdfLinker
	^ (self controller: aController repository: aFileReference)
		repository: aFileReference;
		pdfLinker: aPdfLinker;
		yourself