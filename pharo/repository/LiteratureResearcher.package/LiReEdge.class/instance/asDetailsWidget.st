converting
asDetailsWidget
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(keyLabel LabelModel key TextInputFieldModel).
	model keyLabel label: 'Key'.
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | 
					row
						add: #keyLabel;
						add: #key ];
				yourself).
	model key text: key.
	model key acceptBlock: [ :s | self key: s ].
	^ model