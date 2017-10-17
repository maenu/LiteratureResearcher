example
example
	| graph article1 article2 references1 references2 references3 references4 |
	graph := LiReGraph new.
	article1 := LiReArticle
		graph: graph
		bibtex:
			(CZBibParser
				parse:
					(Character lf asString
						join:
							{'@inproceedings{nguyen2010recurring,'.
							'  title={Recurring bug fixes in object-oriented programs},'.
							'  author={Nguyen, Tung Thanh and Nguyen, Hoan Anh and Pham, Nam H and Al-Kofahi, Jafar and Nguyen, Tien N},'.
							'  booktitle={Proceedings of the 32Nd ACM/IEEE International Conference on Software Engineering-Volume 1},'.
							'  pages={315--324},' . '  year={2010},' . '  organization={ACM},'.
							'  url={http://dl.acm.org/citation.cfm?id=1806847}'.
							'}'})) entries first.
	article2 := LiReArticle
		graph: graph
		bibtex:
			(CZBibParser
				parse:
					(Character lf asString
						join:
							{'@inproceedings{nguyen2011recurring,'.
							'  title={Recurring bug fixes in object-oriented programs},'.
							'  author={Nguyen, Tung Thanh and Nguyen, Hoan Anh and Pham, Nam H and Al-Kofahi, Jafar and Nguyen, Tien N},'.
							'  booktitle={Proceedings of the 32Nd ACM/IEEE International Conference on Software Engineering-Volume 1},'.
							'  pages={315--324},' . '  year={2010},' . '  organization={ACM},'.
							'  url={http://dl.acm.org/citation.cfm?id=1806847}'.
							'}'})) entries first.
	references1 := LiReReferences
		graph: graph
		key: '[2]'
		source: article2
		target: article1.
	references2 := LiReReferences
		graph: graph
		key: '[3]'
		source: article2
		target: article1.
	references3 := LiReReferences
		graph: graph
		key: '[4]'
		source: article2
		target: article1.
	references4 := LiReReferences
		graph: graph
		key: '[1]'
		source: article1
		target: article2.
	graph nodes add: article1.
	graph nodes add: article2.
	graph edges add: references1.
	graph edges add: references2.
	graph edges add: references3.
	graph edges add: references4.
	^ graph