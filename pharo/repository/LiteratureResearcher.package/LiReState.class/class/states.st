as yet unclassified
states
	^ ((self class methodsInProtocol: #states) collect: [ :m | self perform: m selector ]) sorted: [ :a :b | a index < b index ]