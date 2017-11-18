target resize
asAuthorLinks: anArticle
	^ (anArticle incomingEdgesOfClass: LiReHasWritten)
		collect: [ :e | 
			{(#id -> e key).
			(#key -> e key).
			(#color -> (e source asColor rgbTriplet * 255))} asDictionary ]