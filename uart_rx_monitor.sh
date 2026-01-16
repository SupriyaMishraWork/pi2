#!/bin/bash
#
# UART RX Monitor - Direct text display
# Author: Supriya Mishra
#

echo "====================================="
echo "      UART RX Text Monitor           "
echo "====================================="
echo "Type in PuTTY to see text here"
echo "Press Ctrl+C to exit"
echo ""
echo "Monitoring..."
echo ""

# Main monitoring loop
while true; do
    # Read data from UART (with 2-second timeout)
    DATA=$(timeout 2 cat /proc/uart_rx 2>/dev/null)
    
    # If data was received, display it directly
    if [ ! -z "$DATA" ]; then
        echo "Received: $DATA"
    fi
    
    # Small delay to prevent CPU hogging
    sleep 0.1
done
