install-dbuploader:
	curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o dropbox_uploader
	chmod +x dropbox_uploader
build:
	rm -Rf bin
	mkdir -p bin
	javac -d bin -sourcepath . GUI_project.java
run: build
	java -cp bin GUI_project
build-jar: build
	jar cvfm bin/FakeWillGenerator.jar .manifest bin/*.class
deploy-jar: install-dbuploader build-jar
	touch .config
	dropbox_uploader upload bin/FakeWillGenerator.jar public/FakeWillGenerator.jar -f -
