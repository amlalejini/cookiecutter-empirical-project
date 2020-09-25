.PHONY: test clean

COOKIECUTTER_EMP_DIR ?= third-party/Empirical/source

../cut-cookie:
	mkdir -p ../cut-cookie

../cut-cookie/cookiecutter-empirical-project: ../cut-cookie
	echo "\n\n\nCookiecutter Empirical Project\n\n\n\n1\n$(COOKIECUTTER_EMP_DIR)\ncut-cookie\n1\n\n" | cookiecutter . -o ../cut-cookie/ \
	&& cd ../cut-cookie \
	&& git init \
	&& git add . \
	&& git commit -m "Initial commit" \
	&& echo "initial push to cut-cookie worked!"

test: ../cut-cookie/cookiecutter-empirical-project
	cd ../cut-cookie/cookiecutter-empirical-project && make test

clean:
	rm -rf ../cut-cookie
