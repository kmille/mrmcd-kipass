#!/bin/bash
set -e
Xvfb :100 &
sleep 2
exec "$@"

