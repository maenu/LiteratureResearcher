specs
defaultSpec
	^ SpecColumnLayout composed
		newRow: [ :row | row add: #listModel ];
		newRow: [ :row | 
			row
				add: #backModel;
				add: #numberModel;
				add: #forwardModel ]
			height: self toolbarHeight;
		yourself