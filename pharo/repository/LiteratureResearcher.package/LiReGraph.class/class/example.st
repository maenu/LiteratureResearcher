example
example
	| graph article articles author authors |
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
	author := LiReAuthor graph: graph name: 'author'.
	articles := (1 to: 2) collect: [ :i | article copy ].
	authors := (1 to: 8) collect: [ :i | author copy ].
	graph nodes addAll: articles.
	graph nodes addAll: authors.
	(1 to: 32)
		do: [ :i | 
			graph edges
				add:
					(LiReReferences
						graph: graph
						source: articles atRandom
						target: articles atRandom
						key: 'ref' , i asString) ].
	(1 to: 4)
		do: [ :i | 
			graph edges
				add:
					(LiReHasWritten
						graph: graph
						source: authors atRandom
						target: articles atRandom
						key: 'writ' , i asString
						email: 'author@uni.com'
						institution: 'uni'
						country: 'Switzerland') ].
	^ graph