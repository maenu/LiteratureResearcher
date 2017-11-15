typing/selecting keys
newDefaultArguments
	| arguments |
	arguments := OrderedCollection new.
	cookie
		ifNotNil: [ arguments
				addAll:
					{'--cookie-file'.
					(LiReSubprocess escape: cookie pathString)} ].
	userAgent
		ifNotNil: [ arguments
				addAll:
					{'--user-agent'.
					(LiReSubprocess escape: userAgent)} ].
	^ arguments