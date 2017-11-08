searching
gitRepository
	self flag: 'there should be a more generic way to determine the repository on the file system'.
	^ ((self class mcWorkingCopy repositoryGroup repositories
		detect: [ :r | (r isKindOf: MCGitHubRepository) and: [ r projectPath = 'maenu/LiteratureResearcher' ] ]
		ifFound: [ :r | r directory / '..' / '..' ]
		ifNone: [ FileSystem workingDirectory / 'pharo-local' / 'iceberg' / 'maenu' / 'LiteratureResearcher' ]) relativeTo: FileSystem workingDirectory) asFileReference