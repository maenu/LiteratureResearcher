initialization
initializeElement: anElement
	anElement when: TRMouseClick do: [ :event | self clickOn: event element ]