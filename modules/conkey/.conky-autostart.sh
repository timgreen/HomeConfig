#!/bin/bash

pgrep -u $USER conky &> /dev/null || conky &
