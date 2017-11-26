accessing
authors
	^ (((XPath for: '//contrib[@contrib-type=''author'']') in: document)
		collect: [ :entry | 
			{(#stringName -> (self parseContentStringOrNil: (entry xpath: 'string-name'))).
			(#email -> (self parseContentStringOrNil: (entry xpath: 'email'))).
			(#xrefAffRid -> (self parseAttributeStringOrNil: (entry xpath: 'xref[@ref-type=''aff'']/@rid')))} asDictionary ]) asOrderedCollection