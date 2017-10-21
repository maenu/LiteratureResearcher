initialization
newTabHasWritten
	| model |
	model := DynamicComposableModel new.
	model
		instantiateModels: #(list FastTableModel);
		layout:
			(SpecLayout composed
				newRow: [ :row | row add: #list ];
				yourself).
	^ self newTab
		model: model;
		label: 'Has written';
		closeable: false;
		yourself