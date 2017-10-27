converting
asWidget
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(stateLabel LabelModel state DropListModel).
	model stateLabel label: 'State'.
	model state
		items: LiReState states;
		setSelectedItem: state;
		iconHolder: [ :s | s icon ];
		displayBlock: [ :s | s label ];
		whenSelectedItemChanged: [ :s | self state: s ].
	self whenPropertyChangedDo: [ model state setSelectedItem: state ].
	model
		layout:
			(SpecLayout composed
				newRow: [ :row | 
					row
						add: #stateLabel;
						add: #state ];
				yourself).
	^ model