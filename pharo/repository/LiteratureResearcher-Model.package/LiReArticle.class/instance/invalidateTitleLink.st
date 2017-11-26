invalidation
invalidateTitleLink
	titleLink ifNil: [ titleLink := LiReLink new ].
	titleLink
		key: bibtex title value;
		id: bibtex key;
		color: self asColor