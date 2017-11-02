accessing
githubRepository
	^ (self mcWorkingCopy repositoryGroup repositories detect: [ :r | (r isKindOf: MCGitHubRepository) and: [ r projectPath = 'maenu/LiteratureResearcher' ] ]) directory / '..' / '..'