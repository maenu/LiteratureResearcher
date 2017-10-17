accessing
entity: anObject
	super entity: anObject.
	tabManager addTab: self newTabSource.
	tabManager addTab: self newTabTarget