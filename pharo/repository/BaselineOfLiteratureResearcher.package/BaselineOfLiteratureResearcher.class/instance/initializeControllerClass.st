doits
initializeControllerClass
	| controllerClass cachedGithubRepository |
	controllerClass := Smalltalk at: #LiReController ifAbsent: [ self signal: 'Could not find LiReController, loading failed.' ].
	cachedGithubRepository := ((controllerClass mcWorkingCopy repositoryGroup repositories
		detect: [ :r | (r isKindOf: MCGitHubRepository) and: [ r projectPath = 'maenu/LiteratureResearcher' ] ]) directory / '..' / '..'
		relativeTo: FileSystem workingDirectory) asFileReference.
	controllerClass cachedGithubRepository: cachedGithubRepository