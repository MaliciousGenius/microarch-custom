#!/bin/bash
# Copyright (c) 2016 Malicious Genius
#
docker run -d -p 9000:9000 --privileged -v /var/run/docker.sock:/var/run/docker.sock ui-for-docker &