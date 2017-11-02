example
example
	| repository bin graph controller server |
	repository := FileSystem workingDirectory / 'literature-researcher-repository'.
	repository ensureCreateDirectory.
	bin := MCGitHubRepository cacheDirectoryPath / 'maenu' / 'LiteratureResearcher' / 'bin'.
	graph := LiReGraph new.
	controller := LiReController repository: repository bin: bin graph: graph.
	server := LiRePdfLinkerUriSchemeServer controller: controller.
	LiRePdfLinkerUriSchemeServer adoptAsDefault: server.
	server start.
	^ controller