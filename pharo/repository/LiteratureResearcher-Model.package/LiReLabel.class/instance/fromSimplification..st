converting
fromSimplification: aSimplification
	name := aSimplification at: #name.
	color := Color fromHexString: (aSimplification at: #color)