accessing
affiliations
	^ (((XPath for: '//aff') in: document)
		collect: [ :entry | 
			{(#id -> (self parseAttributeStringOrNil: (entry xpath: '@id'))).
			(#institution -> (self parseContentStringOrNil: (entry xpath: 'institution'))).
			(#country -> (self parseContentStringOrNil: (entry xpath: 'country')))} asDictionary ]) asOrderedCollection