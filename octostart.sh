#!/bin/sh
sudo chmod a+rwx /dev/tty*
octoprint serve --host 0.0.0.0 --port $1
