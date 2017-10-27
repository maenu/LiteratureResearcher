baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				configuration: 'XPath'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'NeoJson'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'OSProcess'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'Citezen'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ];
				configuration: 'Roassal2'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/Pharo/MetaRepoForPharo60/main' ].
			spec group: 'default' with: #('XPath' 'NeoJson' 'OSProcess' 'Citezen' 'Roassal2') ]