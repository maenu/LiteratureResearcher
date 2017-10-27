nonediting/nontyping keys
escape: aString
	self flag: 'make this safe'.
	^ '''' , ((aString copyReplaceAll: '\\' with: '\\\\') copyReplaceAll: '''' with: '\\\\''') , ''''