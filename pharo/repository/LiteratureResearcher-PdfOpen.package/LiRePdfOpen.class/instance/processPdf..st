public
processPdf: aFileReference
	^ subprocess
		execute: {(LiReSubprocess escape: aFileReference pathString)}
		wait: 5 seconds