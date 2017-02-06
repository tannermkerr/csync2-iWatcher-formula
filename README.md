# csync2-iWatcher-formula
salt-formula for csync2 with iWatcher for Debian Jessie. This will keep specified locations on the filesystem synced between multiple host.

## Generate csync2 key on master before stating
csync2 -k csync2-iWatcher/csync2.key

## Alter pillar data with your desired csync'd folders and hostnames
