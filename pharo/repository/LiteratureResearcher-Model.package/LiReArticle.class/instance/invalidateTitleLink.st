as yet unclassified
invalidateTitleLink
	titleLink ifNil: [ titleLink := LiReLink new ].
	titleLink
		key: bibtex key;
		id: bibtex title value;
		color: self asColor