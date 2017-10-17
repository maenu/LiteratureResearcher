as yet unclassified
clickAffiliationWithId: aString in: anotherString
	queue
		nextPut: (LiReHyperlinkShowAffiliation id: aString referencingId: anotherString)