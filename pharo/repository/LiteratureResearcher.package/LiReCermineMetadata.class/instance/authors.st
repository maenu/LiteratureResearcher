accessing
authors
	^ (((XPath for: '//contrib[@contrib-type=''author'']') in: document)
		collect: [ :entry | 
			{(#stringName -> (self contentStringOrNil: (entry xpath: 'string-name'))).
			(#email -> (self contentStringOrNil: (entry xpath: 'email'))).
			(#xrefAffRid -> (self attributeStringOrNil: (entry xpath: 'xref[@ref-type=''aff'']/@rid')))} asDictionary ]) asOrderedCollection