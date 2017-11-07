doits
make
	self run: 'cd ''' , self gitRepository pathString , ''' && make'