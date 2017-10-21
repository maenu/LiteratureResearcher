converting
asDetailsWidget
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(keyLabel LabelModel key TextInputFieldModel).
	model keyLabel label: 'Key'.
	model key
		text: key;
		acceptBlock: [ :s | self key: s ].
	self whenPropertyChangedDo: [ model key text: key ].
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | 
					row
						add: #keyLabel;
						add: #key ];
				yourself).
	^ model