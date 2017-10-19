accessing
entity: anObject
	entity ifNotNil: [ entity removeDependent: self ].
	entity := anObject.
	entity addDependent: self.
	self title: entity label.
	tabManager tabs: OrderedCollection new.
	tabManager addTab: self newTabDetails