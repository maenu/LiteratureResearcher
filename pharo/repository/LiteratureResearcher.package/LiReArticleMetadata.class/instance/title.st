accessing
title
	^ ((XPath for: '//title-group') in: document) first contentString trimmed