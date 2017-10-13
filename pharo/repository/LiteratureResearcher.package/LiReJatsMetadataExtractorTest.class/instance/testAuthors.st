tests
testAuthors
	| authors |
	authors := extractor authors.
	self
		assert: authors
		equals:
			{{(#email -> 'osman@inf.unibe.ch').
			(#stringName -> 'Haidar Osman').
			(#xrefAffRid -> 'aff0')} asDictionary.
			{(#email -> 'manuel.leu@students.unibe.ch').
			(#stringName -> 'Manuel Leuenberger').
			(#xrefAffRid -> 'aff1')} asDictionary.
			{(#email -> 'm.f.lungu@rug.nl').
			(#stringName -> 'Mircea Lungu').
			(#xrefAffRid -> 'aff2')} asDictionary.
			{(#email -> 'oscar@inf.unibe.ch').
			(#stringName -> 'Oscar Nierstrasz').
			(#xrefAffRid -> 'aff0')} asDictionary} asOrderedCollection