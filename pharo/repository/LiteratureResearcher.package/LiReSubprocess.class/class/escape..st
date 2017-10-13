nonediting/nontyping keys
escape: aString
	"TODO this is not entirely safe"

	^ '''' , (((aString replaceAll: '''' with: '\\\\''') replaceAll: '\n' with: '\\n') replaceAll: '\r' with: '\\r') , ''''