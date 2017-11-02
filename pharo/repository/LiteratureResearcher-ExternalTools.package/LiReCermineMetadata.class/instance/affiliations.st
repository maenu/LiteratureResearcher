accessing
affiliations
	^ (((XPath for: '//aff') in: document)
		collect: [ :entry | 
			{(#id -> (self attributeStringOrNil: (entry xpath: '@id'))).
			(#institution -> (self contentStringOrNil: (entry xpath: 'institution'))).
			(#country -> (self contentStringOrNil: (entry xpath: 'country')))} asDictionary ]) asOrderedCollection