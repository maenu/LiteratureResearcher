initialization
initializeBindings
	super initializeBindings.
	bindings at: #LiReFastTableAdapter put: #LiReMorphicFastTableAdapter.
	bindings at: #LiReColorChooserAdapter put: #LiReMorphicColorChooserAdapter