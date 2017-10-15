nonediting/nontyping keys
escape: aString
	self flag: 'make this safe'.
	^ '''' , ((aString replaceAll: '\\' with: '\\\\') replaceAll: '''' with: '\\\\''') , ''''