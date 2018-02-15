as yet unclassified
observeProperty: aSymbol
	(self instVarNamed: aSymbol)
		whenChangedDo: [ :newValue :oldValue | 
			announcer
				announce:
					(LiRePropertyChanged
						instance: self
						property: aSymbol
						oldValue: oldValue
						newValue: newValue) ]