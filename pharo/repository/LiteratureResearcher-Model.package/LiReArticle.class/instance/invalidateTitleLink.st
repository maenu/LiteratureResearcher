invalidation
invalidateTitleLink
	(self graph isNil or: [ self bibtex isNil ])
		ifTrue: [ self flag: 'TODO ugly'.
			^ self ].
	self titleLink ifNil: [ self titleLink: LiReLink new ].
	self titleLink
		key: self bibtex title value;
		id: self bibtex key;
		color: self asColor