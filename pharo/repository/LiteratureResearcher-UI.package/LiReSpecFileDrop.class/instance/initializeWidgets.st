initialization
initializeWidgets
	dropModel := ((LiReMorphicFileDrop dropBlock: [ :f | dropBlock cull: f cull: self window ])
		color: Color transparent;
		extent: 10000 @ 10000;
		yourself) asSpecAdapter