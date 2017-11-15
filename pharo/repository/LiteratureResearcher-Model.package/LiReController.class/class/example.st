example
example
	| graph controller server |
	self flag: 'populate example'.
	graph := LiReGraph new.
	controller := LiReController graph: graph.
	server := LiRePdfLinkerUriSchemeServer controller: controller.
	LiRePdfLinkerUriSchemeServer adoptAsDefault: server.
	server start.
	^ controller