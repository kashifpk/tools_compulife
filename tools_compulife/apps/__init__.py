# This list contains all the enabled apps for the project, when you add a new app, add it to this list
# to make it accessible by the project.

import importlib

PROJECT_NAME = 'tools_compulife'
project_package = importlib.import_module("tools_compulife")

from . import visit_counter, code_highlighter
enabled_apps = [visit_counter, code_highlighter]
