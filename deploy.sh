#!/bin/sh

mix deps.get
mix test
PIDS=$(ps aux | grep 'ebisu/_build/prod/rel/ebisu/releases' | awk '{print $2}')
MIX_ENV=prod mix release --force
_build/prod/rel/ebisu/bin/ebisu eval "Ebisu.Release.migrate"
_build/prod/rel/ebisu/bin/ebisu daemon
for PID in ${PIDS[*]}
do
    kill -9 $PID
done
