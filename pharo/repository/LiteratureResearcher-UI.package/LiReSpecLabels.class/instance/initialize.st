initialization
initialize
	super initialize.
	labels := (LiReSortedSet sortBlock: LiReLabel sortBlock) asValueHolder.
	labels whenChangedDo: [ :v | paginatorModel stream: (ReadStream on: v) ]