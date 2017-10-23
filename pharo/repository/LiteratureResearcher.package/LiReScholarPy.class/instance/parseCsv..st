parsing
parseCsv: aString
	^ (NeoCSVReader on: aString readStream)
		separator: $|;
		recordClass: Dictionary;
		addFieldAt: #title converter: [ :s | self parseStringOrNil: s ];
		addFieldAt: #url converter: [ :s | self parseStringOrNil: s ];
		addFieldAt: #year converter: [ :s | self parseIntegerOrNil: s ];
		addFieldAt: #numCitations converter: [ :s | self parseIntegerOrNil: s ];
		addFieldAt: #numVersions converter: [ :s | self parseIntegerOrNil: s ];
		addFieldAt: #clusterId converter: [ :s | self parseStringOrNil: s ];
		addFieldAt: #urlPdf converter: [ :s | self parseStringOrNil: s ];
		addFieldAt: #urlCitations converter: [ :s | self parseStringOrNil: s ];
		addFieldAt: #urlVersions converter: [ :s | self parseStringOrNil: s ];
		addFieldAt: #urlCitation converter: [ :s | self parseStringOrNil: s ];
		addFieldAt: #excerpt converter: [ :s | self parseStringOrNil: s ];
		upToEnd