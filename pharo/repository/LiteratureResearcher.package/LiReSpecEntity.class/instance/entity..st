accessing
entity: anObject
	entity := anObject.
	self title: entity label.
	entity whenPropertyChangedDo: [ self title: entity label ].
	tabManager tabs: OrderedCollection new.
	(((entity class methodDict select: [ :m | m hasPragmaNamed: #liReWidget: ]) collect: [ :m | (m pragmaAt: #liReWidget:) arguments at: 1 ]) associations
		sorted: [ :a :b | a value < b value ])
		do: [ :a | 
			| model |
			model := entity perform: a key.
			tabManager
				addTab:
					(self newTab
						model: model;
						label: model title;
						closeable: false;
						yourself) ]