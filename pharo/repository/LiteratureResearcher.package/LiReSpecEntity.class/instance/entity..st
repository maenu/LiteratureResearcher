accessing
entity: anObject
	entity := anObject.
	self title: entity label.
	tabManager tabs: OrderedCollection new.
	tabManager addTab: self newTabDetails