example
example
	| graph controller server |
	graph := LiReGraph new.
	controller := LiReController graph: graph.
	server := LiRePdfLinkerUriSchemeServer controller: controller.
	LiRePdfLinkerUriSchemeServer adoptAsDefault: server.
	server start.
	^ controller