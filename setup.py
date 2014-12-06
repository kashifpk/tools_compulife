import os
import sys

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))

requires = [
    'PyCK',
    'pyramid',
    'SQLAlchemy',
    'transaction',
    'pyramid_mako',
    'pyramid_tm',
    'pyramid_debugtoolbar',
    'zope.sqlalchemy',
    'webtest',
    'waitress',
    'wtforms',
    'wtdojo'
]

# Requires from subapps
from tools_compulife.apps import enabled_apps
for enabled_app in enabled_apps:
    if hasattr(enabled_app, 'app_requires'):
        for requirement in enabled_app.app_requires:
            if requirement not in requires:
                requires.append(requirement)

if sys.version_info[:3] < (2, 5, 0):
    requires.append('pysqlite')

print(requires)

setup(
    name='tools_compulife',
    version='0.1',
    description='tools_compulife',
    long_description='Online tools offered by compulife. Currently have Code/Syntax Highlighter',
    classifiers=[
        "Programming Language :: Python",
        "Framework :: PyCK",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
    ],
    author='',
    author_email='',
    url='',
    keywords='web PyCK framework pylons pyramid',
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    test_suite='tools_compulife',
    install_requires=requires,
    entry_points="""\
    [paste.app_factory]
    main = tools_compulife:main
    [console_scripts]
    tools_compulife_populate = tools_compulife.scripts.populate:main
    tools_compulife_newapp = tools_compulife.scripts.newapp:main
    """,
)
