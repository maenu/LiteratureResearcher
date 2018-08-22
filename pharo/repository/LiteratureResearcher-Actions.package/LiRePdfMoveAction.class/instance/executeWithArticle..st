execution
executeWithArticle: anArticle
	| pdf |
	self flag: 'that test is a little cheap, maybe there are better approaches'.
	pdf := (anArticle bibtex at: #pdf) value asFileReference.
	pdf exists
		ifFalse: [ pdf := (repository / (anArticle bibtex at: #pdf) value) asFileReference ].
	pdf exists
		ifFalse: [ pdf := (FileSystem workingDirectory / (anArticle bibtex at: #pdf) value) asFileReference ].
	self movePdf: pdf toRepositoryFor: anArticle