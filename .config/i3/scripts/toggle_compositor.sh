#!/bin/bash
if pgrep -x "xcompmgr" >/dev/null; then
	pkill xcompmgr &
else
	xcompmgr -nCfF &
fi

exit 0
