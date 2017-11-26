instance creation
repository: aFileReference pdfLinker: aPdfLinker
	^ (self repository: aFileReference)
		repository: aFileReference;
		pdfLinker: aPdfLinker;
		yourself