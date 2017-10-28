as yet unclassified
mergeBibtex: aBibtexEntry
	bibtex
		type: aBibtexEntry type;
		key: aBibtexEntry key.
	(aBibtexEntry fields reject: [ :f | bibtex hasField: f key ]) do: [ :f | bibtex at: f key put: f rawValue ].
	self propertyChanged: #bibtex