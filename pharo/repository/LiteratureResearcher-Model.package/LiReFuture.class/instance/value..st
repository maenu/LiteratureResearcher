accessing
value: aBlock
	lock := Semaphore new.
	[ [ [ value := aBlock value ]
		on: Error
		do: [ :err | error := err ] ]
		ensure: [ lock signal ] ] fork