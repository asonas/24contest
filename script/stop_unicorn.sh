#!/bin/bash
pid=`cat unicorn.pid`; kill -QUIT $pid
