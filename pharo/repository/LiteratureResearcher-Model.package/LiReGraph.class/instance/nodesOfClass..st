accessing
nodesOfClass: aNodeClass
	^ nodes select: [ :n | n class == aNodeClass ]