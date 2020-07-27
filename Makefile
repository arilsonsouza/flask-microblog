clean:
	@find ./ -name '*.pyc' -exec rm -f {} \;
	@find ./ -name 'Thumbs.db' -exec rm -f {} \;
	@find ./ -name '*~' -exec rm -f {} \;
	rm -rf .cache
	rm -rf build
	rm -rf dist
	rm -rf *.egg-info
	rm -rf htmlcov
	rm -rf .tox/
	rm -rf docs/_build
	pip install -e .[dev] --upgrade --no-cache
	
install:
	pip install -e .['dev']

db_init:
	flask db init

db_upgrade:
	flask db upgrade

db_downgrade:
	flask db downgrade

pybabel_extract:
	pybabel extract -F babel.cfg -k _l -o messages.pot .

pybabel_es:
	pybabel init -i messages.pot -d app/translations -l es

pybabel_compile:
	pybabel compile -d app/translations

pybabel_update:
	pybabel extract -F babel.cfg -k _l -o messages.pot .
	pybabel update -i messages.pot -d app/translations

pip_freeze_requirements:
	pip freeze > requirements.txt