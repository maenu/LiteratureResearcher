converting
asTargetWidget
	| model |
	model := DynamicComposableModel new.
	model widgets at: #edge put: self asCompactWidget.
	model widgets at: #node put: target asCompactWidget.
	model
		layout:
			(SpecLayout composed
				add: #edge;
				add: #node;
				yourself).
	^ model