default: clean dependencies

clean :
	rm -rf build

prepare :
	mkdir -p build

dependencies:  dependency-CERMINE dependency-pdfdbscrap dependency-scholar.py dependency-pdf-linker

dependency-CERMINE : prepare
	git clone git@github.com:CeON/CERMINE.git build/CERMINE
	cd build/CERMINE/cermine-impl && \
		mvn compile assembly:single

dependency-pdfdbscrap : prepare
	git clone git@github.com:limstepf/pdfdbscrap.git build/pdfdbscrap
	cd build/pdfdbscrap && \
		mvn clean package

dependency-scholar.py : prepare
	git clone git@github.com:maenu/scholar.py.git build/scholar.py
	cd build/scholar.py && \
		virtualenv .venv && \
		source .venv/bin/activate && \
		python setup.py develop && \
		deactivate && \
		virtualenv --relocatable .venv && \
		perl -pi -e 's/VIRTUAL_ENV=".*"/VIRTUAL_ENV=".venv"/' .venv/bin/activate

dependency-pdf-linker :
	cd pdf-linker && \
		mvn clean package


