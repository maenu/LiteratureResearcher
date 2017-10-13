public
prepareBibtex: anId with: aBibtexEntry
	"Injects anId as key in a copy of aBibtexEntry and answers it."

	^ aBibtexEntry copy
		key: anId;
		yourself