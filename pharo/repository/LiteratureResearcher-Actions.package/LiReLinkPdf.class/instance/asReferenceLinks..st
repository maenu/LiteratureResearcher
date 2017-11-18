target resize
asReferenceLinks: anArticle
	^ (anArticle outgoingEdgesOfClass: LiReReferences)
		collect: [ :e | 
			{(#id -> e key).
			(#key -> e key).
			(#color -> (e target asColor rgbTriplet * 255))} asDictionary ]