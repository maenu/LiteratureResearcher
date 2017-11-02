
all: prepare CERMINE pdfdbscrap scholar.py pdf-linker PharoUriScheme

prepare :
	mkdir -p build

clean :
	rm -rf build

CERMINE :
	git clone git@github.com:CeON/CERMINE.git build/CERMINE
	cd build/CERMINE/cermine-impl
	mvn compile assembly:single
	cd ../../..

pdfdbscrap:
	git clone git@github.com:limstepf/pdfdbscrap.git build/pdfdbscrap
	cd build/pdfdbscrap
	mvn clean package
	cd ../..

scholar.py:
	git clone git@github.com:maenu/scholar.py.git build/scholar.py
	cd build/scholar.py
	virtualenv .venv
	source .venv/bin/activate
	python setup.py develop
	deactivate
	cd ../..

pdf-linker:
	git clone git@github.com:maenu/pdf-linker.git build/pdf-linker
	cd build/pdf-linker
	mvn clean package
	cd ../..

PharoUriScheme:
	git clone git@github.com:maenu/PharoUriScheme.git build/PharoUriScheme
	cd build/PharoUriScheme
	xcodebuild -scheme PharoUriScheme clean archive
	cd ../..
