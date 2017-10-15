tests
testAffiliations
	| affiliations |
	affiliations := metadata affiliations.
	self
		assert: affiliations
		equals:
			{{(#country -> 'Switzerland').
			(#id -> 'aff0').
			(#institution -> 'SCG, University of Bern')} asDictionary.
			{(#country -> 'Switzerland').
			(#id -> 'aff1').
			(#institution -> 'University of Bern')} asDictionary.
			{(#country -> 'The Netherlands').
			(#id -> 'aff2').
			(#institution -> 'University of Groningen')} asDictionary} asOrderedCollection