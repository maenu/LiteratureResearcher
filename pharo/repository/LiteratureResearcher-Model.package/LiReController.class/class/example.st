example
example
	| repository graph controller server |
	repository := FileSystem workingDirectory / 'literature-researcher-repository'.
	repository ensureCreateDirectory.
	graph := LiReGraph new.
	controller := LiReController repository: repository bin: self bin graph: graph.
	server := LiRePdfLinkerUriSchemeServer controller: controller.
	LiRePdfLinkerUriSchemeServer adoptAsDefault: server.
	server start.
	^ controller