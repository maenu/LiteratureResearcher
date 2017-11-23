converting
asWidget
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(keyLabel LabelModel key TextInputFieldModel orderLabel LabelModel order TextInputFieldModel).
	model keyLabel label: 'Key'.
	model key
		text: key;
		acceptBlock: [ :s | self key: s ].
	self whenPropertyChangedDo: [ model key text: key ].
	model orderLabel label: 'Order'.
	model order
		text: order;
		acceptBlock: [ :s | self order: s asInteger ].
	self whenPropertyChangedDo: [ model order text: order ].
	model
		layout:
			(SpecColumnLayout composed
				newRow: [ :row | 
					row
						add: #keyLabel;
						add: #key ];
				newRow: [ :row | 
					row
						add: #orderLabel;
						add: #order ];
				yourself).
	^ model