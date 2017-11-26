accessing
allInstancesSorted
	^ (self allInstances sorted: self sortBlock) ifEmpty: [ {self default} ]