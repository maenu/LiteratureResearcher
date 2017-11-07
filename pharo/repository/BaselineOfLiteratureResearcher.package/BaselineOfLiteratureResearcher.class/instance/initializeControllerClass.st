doits
initializeControllerClass
	| controllerClass |
	controllerClass := Smalltalk at: #LiReController ifAbsent: [ self signal: 'Could not find LiReController, loading failed.' ].
	controllerClass cachedGithubRepository: self gitRepository