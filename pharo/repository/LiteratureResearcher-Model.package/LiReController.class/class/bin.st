accessing
bin
	^ Bin ifNil: [ Bin := self cachedGithubRepository / 'bin' ]