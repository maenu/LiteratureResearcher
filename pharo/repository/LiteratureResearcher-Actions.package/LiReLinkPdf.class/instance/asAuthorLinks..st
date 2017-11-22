target resize
asAuthorLinks: anArticle
	^ (anArticle incomingEdgesOfClass: LiReHasWritten) collect: [ :e | e sourceLink ]