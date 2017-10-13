as yet unclassified
ensureSubDirectoryNamed: aString
	| subDirectory |
	subDirectory := directory / aString.
	subDirectory ensureCreateDirectory.
	^ subDirectory