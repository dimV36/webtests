#!/usr/bin/env venv/bin/python
__author__ = 'dimv36'
from webtests import app


if __name__ == "__main__":
    app.debug = True
    app.run()