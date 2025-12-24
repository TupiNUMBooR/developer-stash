#!/usr/bin/env bash
git --no-pager log --format=format:%s origin/master..HEAD | awk '{print "- "$0}'
