server handling
startServerFor: aController
	| server |
	server := LiRePdfLinkerUriSchemeServer controller: aController.
	LiRePdfLinkerUriSchemeServer adoptAsDefault: server.
	server start