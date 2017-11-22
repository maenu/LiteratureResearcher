target resize
asReferenceLinks: anArticle
	^ (anArticle outgoingEdgesOfClass: LiReReferences) collect: [ :e | e targetLink ]