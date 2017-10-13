accessing
referenceKeys
	^ (((XPath for: '//ref-list/ref') in: document)
		collect: [ :entry | 
			| matcher |
			matcher := RxMatcher forString: '^([^\s]+)'.
			matcher matches: entry contentString trimmed.
			matcher subexpression: 2 ]) asOrderedCollection