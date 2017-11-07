doits
makeBinExecutable
	self run: 'cd ''' , (self gitRepository / 'bin') pathString , ''' && chmod +x *'