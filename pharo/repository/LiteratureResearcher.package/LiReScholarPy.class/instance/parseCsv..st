parsing
parseCsv: aString
	^ (NeoCSVReader on: aString readStream)
		separator: $|;
		recordClass: Dictionary;
		addFieldAt: #title;
		addFieldAt: #url converter: [ :string | self parseUrl: string ];
		addIntegerFieldAt: #year;
		addIntegerFieldAt: #numCitations;
		addIntegerFieldAt: #numVersions;
		addFieldAt: #clusterId;
		addFieldAt: #urlPdf converter: [ :string | self parseUrl: string ];
		addFieldAt: #urlCitations converter: [ :string | self parseUrl: string ];
		addFieldAt: #urlVersions converter: [ :string | self parseUrl: string ];
		addFieldAt: #urlCitation converter: [ :string | self parseUrl: string ];
		addFieldAt: #excerpt;
		upToEnd