#!/bin/sh

# Dodanie bezpiecznego katalogu
git config --global --add safe.directory /workspace

# Wykonanie przekazanych poleceń
exec "$@"
