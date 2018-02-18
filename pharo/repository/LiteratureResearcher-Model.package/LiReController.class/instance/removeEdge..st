removing
removeEdge: anEdge
	(view edgeFromModel: anEdge)
		ifNotNil: [ :e | 
			RTLabeled removeLabelFrom: e.
			e remove ]