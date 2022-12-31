# Find derby directory in local computer
DERBY_DIR=$cd c:\derby\bin
echo "$DERBY_DIR"

# Call derby server
DERBY_CALL=$c:\derby\bin\startNetworkServer -h 0.0.0.0
echo "$DERBY_CALL"
