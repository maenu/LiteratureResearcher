converting
asDetailsWidget
	| model |
	model := DynamicComposableModel new.
	model
		instantiateModels:
			#(nameLabel LabelModel name TextInputFieldModel emailLabel LabelModel email TextInputFieldModel).
	model nameLabel label: 'Name'.
	model emailLabel label: 'Email'.
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | 
					row
						add: #nameLabel;
						add: #name ];
				newRow: [ :row | 
					row
						add: #emailLabel;
						add: #email ];
				yourself).
	model name text: name.
	model email text: email.
	model name acceptBlock: [ :s | name := s ].
	model email acceptBlock: [ :s | email := s ].
	^ model