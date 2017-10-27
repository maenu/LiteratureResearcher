event handling
dropFiles: anEvent
	(FileStream requestDropStream: 1)
		ifNotNil: [ :in | 
			| fileReference |
			fileReference := in name asFileReference.
			in close.
			dropBlock value: fileReference ]