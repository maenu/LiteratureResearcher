initialization
setUp
	id := 'Osma16a'.
	title := {(#id -> 'Osma16a').
	(#key -> 'Tracking Null Checks in Open-Source Java Systems').
	(#color -> {127 . 7 . 0})} asDictionary.
	authors := {{(#id -> 'Osma16a').
	(#key -> 'Haidar Osman').
	(#color -> {127 . 7 . 0})} asDictionary.
	{(#id -> 'Osma16a').
	(#key -> 'Manuel Leuenberger').
	(#color -> {127 . 7 . 0})} asDictionary.
	{(#id -> 'Osma16a').
	(#key -> 'Mircea Lungu').
	(#color -> {127 . 7 . 0})} asDictionary.
	{(#id -> 'Osma16a').
	(#key -> 'Oscar Nierstrasz').
	(#color -> {127 . 7 . 0})} asDictionary}.
	references := {{(#id -> '2').
	(#key -> '[2]').
	(#color -> {127 . 7 . 0})} asDictionary.
	{(#id -> '3').
	(#key -> '[3]').
	(#color -> {127 . 7 . 0})} asDictionary} asOrderedCollection.
	pdfLinker := LiRePdfLinker subprocess: (LiReSubprocess command: '../pdf-linker.sh').
	pdf := '../test/Osma16a.pdf' asFileReference