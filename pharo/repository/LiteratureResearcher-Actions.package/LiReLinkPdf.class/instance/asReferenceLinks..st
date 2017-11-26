converting
asReferenceLinks: anArticle
	^ (anArticle outgoingEdgesOfClass: LiReReferences) collect: [ :e | e asTargetLink ]