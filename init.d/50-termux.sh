set -x
set -e

am startservice -n com.termux/com.termux.app.TermuxService \
    -a com.termux.service_execute \
    -d com.termux.file:///data/data/com.termux/files/home/.termux/boot.sh \
    --ez com.termux.execute.background true \

exit 0
