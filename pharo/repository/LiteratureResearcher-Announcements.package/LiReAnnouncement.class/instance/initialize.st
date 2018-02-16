initialization
initialize
	super initialize.
	then := [  ].
	except := [ :e | e signal ].
	finally := [  ]