converting
asDetailsWidget
	| superModel model |
	superModel := super asDetailsWidget.
	model := DynamicComposableModel new.
	model instantiateModels: #(superModel DynamicComposableModel emailLabel LabelModel email TextInputFieldModel institutionLabel LabelModel institution TextInputFieldModel countryLabel LabelModel country TextInputFieldModel).
	model emailLabel label: 'Email'.
	model institutionLabel label: 'Institution'.
	model countryLabel label: 'Country'.
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
	model email text: email.
	model institution text: institution.
	model country text: country.
	model email acceptBlock: [ :s | self email: s ].
	model institution acceptBlock: [ :s | self institution: s ].
	model country acceptBlock: [ :s | self country: s ].
	model assign: superModel to: #superModel.
	^ model