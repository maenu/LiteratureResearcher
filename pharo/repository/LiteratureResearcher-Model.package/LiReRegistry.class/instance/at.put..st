accessing
at: aSymbol put: aController
	| controller |
	controller := dictionary at: aSymbol put: aController.
	self startServerFor: controller.
	^ controller