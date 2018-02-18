converting
asWidget
	| model |
	model := DynamicComposableModel new.
	model instantiateModels: #(hiddenToggleButton ButtonModel).
	self hidden
		ifTrue: [ model hiddenToggleButton label: 'Show' ]
		ifFalse: [ model hiddenToggleButton label: 'Hide' ].
	model hiddenToggleButton action: [ self hidden: self hidden not ].
	self
		whenPropertyChangedDo: [ self hidden
				ifTrue: [ model hiddenToggleButton label: 'Show' ]
				ifFalse: [ model hiddenToggleButton label: 'Hide' ] ].
	model
		layout:
			(SpecColumnLayout composed
				newRow: [ :row | row add: #hiddenToggleButton ] height: DynamicComposableModel toolbarHeight;
				yourself).
	^ model