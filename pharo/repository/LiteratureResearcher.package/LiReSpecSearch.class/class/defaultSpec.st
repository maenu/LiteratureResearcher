specs
defaultSpec
	^ SpecColumnLayout composed
		add: #searchBar height: self toolbarHeight;
		add: #results;
		yourself