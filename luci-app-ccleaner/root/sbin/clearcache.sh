#!/bin/sh

clearcache () {
    sync
    echo 3 > /proc/sys/vm/drop_caches 
}

additional () {
    sync
    rm -rf /tmp/luci-indexcache*
    rm -rf /tmp/luci-modulecache/*
}

clearcache
additional
echo "cleared..."

exit 0