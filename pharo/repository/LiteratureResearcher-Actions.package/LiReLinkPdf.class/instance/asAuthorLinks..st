converting
asAuthorLinks: anArticle
	^ (anArticle incomingEdgesOfClass: LiReHasWritten) collect: [ :e | e asSourceLink ]