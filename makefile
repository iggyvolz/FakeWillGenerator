build:
	rm -Rf bin
	mkdir -p bin
	javac -d bin -sourcepath . GUI_project.java
run: build
	java -cp bin GUI_project
build-jar: build
	jar cvfm bin/FakeWillGenerator.jar .manifest bin/*.class
