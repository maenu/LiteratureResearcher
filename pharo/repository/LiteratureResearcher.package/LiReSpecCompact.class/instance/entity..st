accessing
entity: anObject
	entity := anObject.
	label label: entity label.
	entity whenPropertyChangedDo: [ label label: entity label ]