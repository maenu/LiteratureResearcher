as yet unclassified
invalidateLink
	self link ifNil: [ self link: LiReLink new ].
	self link key: self key.
	self link id: self key