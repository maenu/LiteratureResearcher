converting
asReferenceLinks: anArticle
	^ (anArticle incomingEdgesOfClass: LiReReferences)
		collect: [ :e | 
			{(#id -> e key).
			(#key -> e key).
			(#color -> e target state color rgbTriplet)} asDictionary ]