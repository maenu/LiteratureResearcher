converting
asWidget
	| superModel model |
	superModel := super asWidget.
	model := DynamicComposableModel new.
	model title: 'Details'.
	model
		instantiateModels:
			#(superModel DynamicComposableModel emailLabel LabelModel email TextInputFieldModel institutionLabel LabelModel institution TextInputFieldModel countryLabel LabelModel country TextInputFieldModel).
	model emailLabel label: 'Email'.
	model institutionLabel label: 'Institution'.
	model countryLabel label: 'Country'.
	model email
		text: self email;
		acceptBlock: [ :s | self email: s ].
	model institution
		text: self institution;
		acceptBlock: [ :s | self institution: s ].
	model country
		text: self country;
		acceptBlock: [ :s | self country: s ].
	model assign: superModel to: #superModel.
	self
		whenPropertyChangedDo: [ model email text: self email.
			model institution text: self institution.
			model country text: self country ].
	model
		layout:
			(SpecLayout composed
				newColumn: [ :column | 
					column
						newRow: [ :row | row add: #superModel ];
						newRow: [ :row | 
							row
								add: #emailLabel;
								add: #email ];
						newRow: [ :row | 
							row
								add: #institutionLabel;
								add: #institution ];
						newRow: [ :row | 
							row
								add: #countryLabel;
								add: #country ] ];
				yourself).
	^ model