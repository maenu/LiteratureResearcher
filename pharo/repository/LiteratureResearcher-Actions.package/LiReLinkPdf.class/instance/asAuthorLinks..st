target resize
asAuthorLinks: anArticle
	^ (anArticle incomingEdgesOfClass: LiReHasWritten)
		collect: [ :e | 
			{(#id -> e key).
			(#key -> e key).
			(#color -> e source state color)} asDictionary ]