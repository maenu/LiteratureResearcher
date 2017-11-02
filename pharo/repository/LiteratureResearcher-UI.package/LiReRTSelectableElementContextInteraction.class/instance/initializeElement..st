initialization
initializeElement: anElement
	anElement
		when: TRMouseLeftClick
		do: [ :event | 
			self presentation ifNil: [ self presentation: (anElement view attributeAt: #GlamourContext) presentation ].
			anElement model ifNotNil: [ self presentation selection: anElement model ] ]