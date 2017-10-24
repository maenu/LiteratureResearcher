actions
unselect: anElement
	anElement removeAttributeAt: #selected.
	anElement trachelShape allColor: (anElement removeAttributeAt: #originalColor)