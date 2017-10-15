instance creation
fromJatsFile: aJatsFileReference
	^ self document: (XMLDOMParser parseFileNamed: aJatsFileReference pathString)