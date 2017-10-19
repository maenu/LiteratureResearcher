example
example
	| graph article articles author authors institution institutions |
	graph := LiReGraph new.
	article := LiReArticle
		graph: graph
		bibtex:
			(CZBibParser
				parse:
					(Character lf asString
						join:
							{'@inproceedings{nguyen2010recurring,' . '  title={Recurring bug fixes in object-oriented programs},' . '  author={Nguyen, Tung Thanh and Nguyen, Hoan Anh and Pham, Nam H and Al-Kofahi, Jafar and Nguyen, Tien N},'.
							'  booktitle={Proceedings of the 32Nd ACM/IEEE International Conference on Software Engineering-Volume 1},' . '  pages={315--324},' . '  year={2010},' . '  organization={ACM},' . '  url={http://dl.acm.org/citation.cfm?id=1806847}'.
							'}'})) entries first.
	author := LiReAuthor graph: graph name: 'author' email: 'author@uni.com'.
	institution := LiReInstitution graph: graph name: 'uni' country: 'Switzerland'.
	articles := (1 to: 1) collect: [ :i | article copy ].
	authors := (1 to: 32) collect: [ :i | author copy ].
	institutions := (1 to: 16) collect: [ :i | institution copy ].
	graph nodes addAll: articles.
	graph nodes addAll: authors.
	graph nodes addAll: institutions.
	(1 to: 128)
		do: [ :i | 
			graph edges
				add:
					(LiReReferences
						graph: graph
						key: 'ref' , i asString
						source: articles atRandom
						target: articles atRandom) ].
	(1 to: 128)
		do: [ :i | 
			graph edges
				add:
					(LiReHasWritten
						graph: graph
						key: 'writ' , i asString
						source: authors atRandom
						target: articles atRandom) ].
	(1 to: 64)
		do: [ :i | 
			graph edges
				add:
					(LiReIsAffiliatedWith
						graph: graph
						key: 'inst' , i asString
						source: authors atRandom
						target: institutions atRandom) ].
	^ graph