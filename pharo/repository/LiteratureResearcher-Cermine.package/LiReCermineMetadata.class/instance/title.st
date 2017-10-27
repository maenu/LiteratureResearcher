accessing
title
	^ ((XPath for: '//title-group') in: document) ifNotNil: [ :s | s first contentString trimmed ]