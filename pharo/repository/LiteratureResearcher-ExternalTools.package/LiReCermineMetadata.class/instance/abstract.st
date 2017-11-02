accessing
abstract
	^ ((XPath for: '//abstract') in: document) first ifNotNil: [ :e | e contentString trimmed ]