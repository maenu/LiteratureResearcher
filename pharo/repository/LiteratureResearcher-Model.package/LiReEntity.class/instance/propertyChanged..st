announcements
propertyChanged: aSymbol
	| value |
	value := self instVarNamed: aSymbol.
	announcer
		announce:
			(LiRePropertyChanged
				instance: self
				property: aSymbol
				oldValue: value
				newValue: value)