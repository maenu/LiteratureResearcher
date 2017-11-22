converting
fromSimplification: aSimplification
	key := aSimplification at: #key.
	order := aSimplification at: #order.
	link := (aSimplification at: #link) ifNotNil: [ :d | LiReLink fromSimplification: d ]