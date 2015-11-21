.PHONY: All init exec_hello

All: exec_hello

exec_hello:
	python hello.py

init:
	-virtualenv --no-site-packages venv

update:
	( \
		. venv/bin/activate; \
		pip install --upgrade -r requirement.txt; \
	)
