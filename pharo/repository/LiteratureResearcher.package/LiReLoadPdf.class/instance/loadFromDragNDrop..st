private
loadFromDragNDrop: anArticle
	| pdf drop |
	drop := LiReSpecFileDrop
		dropBlock: [ :p :w | 
			pdf := p.
			w close ].
	drop openWithSpec.
	drop window modalRelativeTo: World.
	^ pdf