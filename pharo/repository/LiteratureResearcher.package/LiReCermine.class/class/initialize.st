initialization
initialize
	OutputJats := 'jats'.
	OutputText := 'text'.
	OutputZones := 'zones'.
	OutputTrueviz := 'trueviz'.
	OutputImages := 'images'.
	OutputBibtex := 'bibtex'.
	Subject ifNil: [ Subject := 'subject' ]