target resize
isLinksEmpty: aDictionary
	^ (aDictionary at: #title) isNil and: [ (aDictionary at: #authors) isEmpty and: [ (aDictionary at: #references) isEmpty ] ]