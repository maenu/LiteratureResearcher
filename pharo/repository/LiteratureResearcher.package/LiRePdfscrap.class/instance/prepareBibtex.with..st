public
prepareBibtex: anId with: aBibtexEntry
	"Injects anId as key for aBibtexEntry and answers it."

	| matcher |
	matcher := RxMatcher forString: '^([^{]+{)([^,]+)(,.*)$'.
	matcher matches: aBibtexEntry.
	^ (matcher subexpression: 2) , anId , (matcher subexpression: 4)