example
example
	| widget |
	widget := self
		dropBlock: [ :f :w | 
			Halt now.
			w close ].
	widget openWithSpec.
	widget window modalRelativeTo: World.
	Halt now