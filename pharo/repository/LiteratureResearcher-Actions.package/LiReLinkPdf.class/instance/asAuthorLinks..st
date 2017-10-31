target resize
asAuthorLinks: anArticle
	^ (anArticle incomingEdgesOfClass: LiReHasWritten)
		collect: [ :e | 
			{(#id -> e key).
			(#key -> e key).
			(#color -> (e source state color rgbTriplet * 255))} asDictionary ]