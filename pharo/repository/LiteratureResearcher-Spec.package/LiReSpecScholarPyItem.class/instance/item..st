accessing
item: anItem
	item := anItem.
	titleModel text: (item at: #title).
	yearModel text: (item at: #year) asString.
	citationsModel text: (item at: #numCitations) asString.
	excerptModel text: (item at: #excerpt)