baselines
baseline: spec
	<baseline>
	spec
		for: #common
		do: [ spec
				configuration: 'XPath'
					with: [ spec
						versionString: #stable;
						repository: 'http://www.smalltalkhub.com/mc/PharoExtras/XPath/main' ];
				configuration: 'NeoCSV'
					with: [ spec
						versionString: #stable;
						repository: 'http://mc.stfx.eu/Neo' ];
				configuration: 'OSSubprocess'
					with: [ spec
						versionString: #stable;
						repository: 'github://marianopeck/OSSubprocess/repository' ];
				package: 'LiteratureResearcher' with: [ spec requires: #('XPath' 'NeoCSV' 'OSSubprocess') ].
			spec
				group: 'default' with: #('Core');
				group: 'Core' with: #('LiteratureResearcher') ]