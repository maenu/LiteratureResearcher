instance creation
graph: aGraph
	| controller repository bin tools actions |
	controller := self new
		graph: aGraph;
		yourself.
	repository := FileSystem workingDirectory / 'literature-researcher-repository'.
	bin := self gitRepository / 'bin'.
	tools := self toolsWithBin: bin.
	actions := self actionsWithController: controller repository: repository tools: tools.
	^ controller
		actions: actions;
		yourself