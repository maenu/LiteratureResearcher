parsing
parseCsv: aString
	^ (NeoCSVReader on: aString readStream)
		separator: $|;
		recordClass: Dictionary;
		addFieldAt: #title;
		addFieldAt: #url converter: [ :string | self parseStringOrNil: string ];
		addIntegerFieldAt: #year;
		addIntegerFieldAt: #numCitations;
		addIntegerFieldAt: #numVersions;
		addFieldAt: #clusterId;
		addFieldAt: #urlPdf converter: [ :string | self parseStringOrNil: string ];
		addFieldAt: #urlCitations converter: [ :string | self parseStringOrNil: string ];
		addFieldAt: #urlVersions converter: [ :string | self parseStringOrNil: string ];
		addFieldAt: #urlCitation converter: [ :string | self parseStringOrNil: string ];
		addFieldAt: #excerpt;
		upToEnd