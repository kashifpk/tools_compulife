pyckapps.code_highlighter
==========================

Pluggable code highlighting app for PyCK framework. This app goes under the apps folder in a pyck project and cannot be used standalone(without modification). If you're using git to manage your project you can put this app's repo as a subtree without your project.

For example you can add this as a subtree to your PyCK project like::


    git remote add CH git@github.com:kashifpk/pyckapps.code_highlighter.git
    git subtree add --prefix myproject/apps/code_highlighter CH master

Later if you want to pull latest changes (any updates to the app) you can do::

    git subtree pull --prefix myproject/apps/code_highlighter CH master


Demo
----

A working demo of the latest code can be fount at: `tools.compulife.com.pk <http://tools.compulife.com.pk/code_highlighter>`_
