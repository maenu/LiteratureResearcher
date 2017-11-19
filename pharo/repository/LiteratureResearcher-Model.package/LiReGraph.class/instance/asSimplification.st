converting
asSimplification
	| nodesOrdered |
	nodesOrdered := nodes value asOrderedCollection.
	^ super asSimplification
		addAll:
			{(#nodes -> (nodesOrdered collect: [ :n | n asSimplification ])).
			(#edges
				->
					(edges value
						collect: [ :e | 
							e asSimplification
								addAll:
									{(#source -> (nodesOrdered indexOf: e source)).
									(#target -> (nodesOrdered indexOf: e target))} asDictionary;
								yourself ]))} asDictionary;
		yourself