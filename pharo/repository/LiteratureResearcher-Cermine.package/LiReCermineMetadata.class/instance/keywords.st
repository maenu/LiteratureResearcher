accessing
keywords
	^ ((XPath for: '//kwd-group/kwd') in: document) collect: [ :entry | entry strings first ]