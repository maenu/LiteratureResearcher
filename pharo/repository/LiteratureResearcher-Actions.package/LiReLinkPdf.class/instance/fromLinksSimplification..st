target resize
fromLinksSimplification: aSimplification
	^ {(#id -> (aSimplification at: #id)).
	(#title -> (aSimplification at: #title ifPresent: [ :s | LiReLink fromSimplification: s ])).
	(#authors -> ((aSimplification at: #authors) collect: [ :s | LiReLink fromSimplification: s ])).
	(#references -> ((aSimplification at: #references) collect: [ :s | LiReLink fromSimplification: s ]))} asDictionary