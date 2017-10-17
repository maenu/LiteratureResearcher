initialization
initializeWidgets
	tabNode := self newTabNode.
	tabsEdges := OrderedCollection new.
	tabManager := self newTabManager.
	tabManager
		addTab:
			(self newTab
				model: tabNode;
				label: 'Details';
				closeable: false;
				yourself)