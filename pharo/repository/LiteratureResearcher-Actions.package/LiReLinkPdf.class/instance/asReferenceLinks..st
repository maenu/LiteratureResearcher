target resize
asReferenceLinks: anArticle
	^ (anArticle outgoingEdgesOfClass: LiReReferences)
		collect: [ :e | 
			{(#id -> e key).
			(#key -> e key).
			(#color -> (e target state color rgbTriplet * 255))} asDictionary ]