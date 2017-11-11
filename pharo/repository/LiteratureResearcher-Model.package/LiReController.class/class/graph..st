accessing
graph: aGraph
	^ self new
		graph: aGraph;
		repository: FileSystem workingDirectory / 'literature-researcher-repository';
		scholarPyCookie: '/Users/maenu/Documents/phd/projects/LiteratureResearcher/scholar.py/cookies.txt' asFileReference;
		scholarPyUserAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36';
		bin: self gitRepository / 'bin';
		yourself