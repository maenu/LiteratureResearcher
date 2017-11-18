factory
buildWidget
	^ (ColorChooserMorph on: self model color: #selectedColor changeColor: #selectedColor:)
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		yourself