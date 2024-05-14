#!/bin/sh

#  pushNotification.sh
#  SwiftUILearnings
#
#  Created by Saurabh Verma on 12/05/24.
#  

# This script helps in testing push notifications using Xcode command line tools.
#
# Output of command xcrun simctl push --help
#
# Sends a simulated push notification
# Usage: simctl push <device> [<bundle identifier>] (<json file> | -)
#
#    bundle identifier
#         The bundle identifier of the target application
#         If the payload file contains a 'Simulator Target Bundle' top-level key this parameter may be omitted.
#         If both are provided this argument will override the value from the payload.
#    json file
#         Path to a JSON payload or '-' to read from stdin. The payload must:
#           - Contain an object at the top level.
#           - Contain an 'aps' key with valid Apple Push Notification values.
#           - Be 4096 bytes or less.
#
# Only application remote push notifications are supported.
# VoIP, Complication, File Provider, and other types are not supported.

# Notification payload filename
PAYLOAD_FILENAME="payload.apns"

# Switch to project directory having .xcodeproj file
cd ..

# Fetch bundle identifier value
BUNDLE_IDENTIFIER=`xcodebuild -showBuildSettings | grep PRODUCT_BUNDLE_IDENTIFIER | awk -F ' = ' '{ print $2 }'`

# Check if bundle identifier fetched is success or not
if [ -z "$BUNDLE_IDENTIFIER" ]; then
    echo "Error : Not able to find bundle identifier in Info.plist"
    exit 1
fi

# Print the bundle identifier
echo "Bundle Identifier: $BUNDLE_IDENTIFIER"

cd SwiftUILearnings/Resources
xcrun simctl push booted "$BUNDLE_IDENTIFIER" "$PAYLOAD_FILENAME"
