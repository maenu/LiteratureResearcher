execution
executeIn: anArticle
	| pdf |
	self flag: 'that test is a little cheap, maybe there are better approaches'.
	pdf := (anArticle bibtex at: #pdf) value asFileReference.
	pdf exists
		ifFalse: [ pdf := (FileSystem workingDirectory / repository / (anArticle bibtex at: #pdf) value asPath) asFileReference ].
	pdf exists
		ifFalse: [ pdf := (FileSystem workingDirectory / (anArticle bibtex at: #pdf) value asPath) asFileReference ].
	self movePdf: pdf toRepositoryFor: anArticle