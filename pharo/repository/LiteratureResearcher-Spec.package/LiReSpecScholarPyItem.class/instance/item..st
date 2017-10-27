accessing
item: anItem
	item := anItem.
	titleModel text: (item at: #title ifAbsent: nil).
	yearModel text: (item at: #year ifPresent: [ :o | o asString ] ifAbsent: nil).
	citationsModel text: (item at: #numCitations ifPresent: [ :o | o asString ] ifAbsent: nil).
	excerptModel text: (item at: #excerpt ifAbsent: nil)