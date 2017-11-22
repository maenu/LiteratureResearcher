accessing
invalidateLink
	link ifNil: [ link := LiReLink new ].
	link key: key.
	link id: key