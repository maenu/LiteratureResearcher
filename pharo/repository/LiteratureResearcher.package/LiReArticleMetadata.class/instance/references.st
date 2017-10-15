accessing
references
	^ (((XPath for: '//ref-list/ref') in: document)
		collect: [ :entry | 
			| matcher key text |
			text := entry contentString trimmed.
			matcher := RxMatcher forString: '^([^\s]+)'.
			matcher matches: text.
			key := matcher subexpression: 2.
			{(#key -> key).
			(#text -> text)} asDictionary ]) asOrderedCollection