nonediting/nontyping keys
escape: aString
	self flag: 'make this safe'.
	^ '''' , ((((aString copyReplaceAll: '\' with: '\\') copyReplaceAll: '''' with: ' ') copyReplaceAll: String lf with: ' ') copyReplaceAll: String cr with: ' ') , ''''