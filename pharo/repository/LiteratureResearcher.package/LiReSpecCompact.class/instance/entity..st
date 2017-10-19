accessing
entity: anObject
	entity ifNotNil: [ entity removeDependent: self ].
	entity := anObject.
	entity addDependent: self.
	label label: entity label