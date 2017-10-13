as yet unclassified
readCsv: aString
	^ (NeoCSVReader on: aString readStream)
		separator: $|;
		namedColumnsConfiguration;
		"title"
			addField;
		"url"
			addFieldConverter: [ :string | ZnUrl fromString: string ];
		"year"
			addIntegerField;
		"num_citations"
			addIntegerField;
		"num_versions"
			addIntegerField;
		"cluster_id"
			addField;
		"url_pdf"
			addFieldConverter: [ :string | ZnUrl fromString: string ];
		"url_citations"
			addFieldConverter: [ :string | ZnUrl fromString: string ];
		"url_versions"
			addFieldConverter: [ :string | ZnUrl fromString: string ];
		"url_citation"
			addFieldConverter: [ :string | ZnUrl fromString: string ];
		"excerpt"
			addField;
		upToEnd