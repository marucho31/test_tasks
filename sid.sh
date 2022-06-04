#!/bin/bash
grep "10.1.192.38" ./log.txt | sed -En 's!^.*sid=/(.*)/&.*$!\1!p' | sort
