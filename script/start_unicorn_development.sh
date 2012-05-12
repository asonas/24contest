#!/bin/bash
unicorn_rails -c ./config/unicorn_development.rb -p 5001 -D
