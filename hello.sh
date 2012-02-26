#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
erl -noshell -pa $DIR -s hello start -s init stop
