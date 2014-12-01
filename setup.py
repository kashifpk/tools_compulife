import os
import sys

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README.txt')).read()
CHANGES = open(os.path.join(here, 'CHANGES.txt')).read()

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
    'wtdojo',
    'pygments'
]

if sys.version_info[:3] < (2, 5, 0):
    requires.append('pysqlite')

setup(
    name='tools_compulife',
    version='0.0',
    description='tools_compulife',
    long_description=README + '\n\n' + CHANGES,
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
