all: CERMINE pdfdbscrap scholar.py pdf-linker

clean :
	rm -rf build

build : clean
	mkdir -p build

CERMINE : build
	git clone git@github.com:CeON/CERMINE.git build/CERMINE
	cd build/CERMINE/cermine-impl && \
		mvn compile assembly:single

pdfdbscrap : build
	git clone git@github.com:limstepf/pdfdbscrap.git build/pdfdbscrap
	cd build/pdfdbscrap && \
		mvn clean package

scholar.py : build
	git clone git@github.com:maenu/scholar.py.git build/scholar.py
	cd build/scholar.py && \
		virtualenv .venv && \
		source .venv/bin/activate && \
		python setup.py develop && \
		deactivate

pdf-linker : build
	cd pdf-linker && \
		mvn clean package
