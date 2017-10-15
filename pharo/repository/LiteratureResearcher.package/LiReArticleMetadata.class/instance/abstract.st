accessing
abstract
	^ ((XPath for: '//abstract') in: document) first contentString trimmed