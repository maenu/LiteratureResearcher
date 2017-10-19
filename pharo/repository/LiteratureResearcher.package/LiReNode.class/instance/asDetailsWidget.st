converting
asDetailsWidget
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(stateLabel LabelModel state DropListModel).
	model stateLabel label: 'State'.
	model state items: LiReState states.
	model state setSelectedItem: state.
	model state iconHolder: [ :s | s icon ].
	model state displayBlock: [ :s | s label ].
	model state whenSelectedItemChanged: [ :s | self state: s ].
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | 
					row
						add: #stateLabel;
						add: #state ];
				yourself).
	^ model