#!/bin/sh
WHICH="(from $1)"

echo "Waiting for linkerconfig $WHICH default to be mounted.."
while [ -f /linkerconfig/default/ld.config.txt ]; do sleep 1; done;

echo "Waiting for linkerconfig $WHICH APEX mount.."
while [ ! -f /linkerconfig/com.android.runtime/ld.config.txt ]; do sleep 1; done;

echo "Waiting for linkerconfig $WHICH done."