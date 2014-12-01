# This list contains all the enabled apps for the project, when you add a new app, add it to this list
# to make it accessible by the project.

import importlib

PROJECT_NAME = 'tools_compulife'
project_package = importlib.import_module("tools_compulife")

#from . import app1, app2
#enabled_apps = [app1, app2]

from . import visit_counter
enabled_apps = [visit_counter]

