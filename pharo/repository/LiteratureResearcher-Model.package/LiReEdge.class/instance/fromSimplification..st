converting
fromSimplification: aSimplification
	self key: (aSimplification at: #key).
	self order: (aSimplification at: #order).
	self link: ((aSimplification at: #link) ifNotNil: [ :d | LiReLink fromSimplification: d ])