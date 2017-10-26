accessing
title
	^ ((XPath for: '//title-group') in: document) first ifNotNil: [ :s | s contentString trimmed ]