#!/bin/bash

ANDROID_HOME=/opt/android/android-sdk-linux

TEMP_FILE_TEMPLATE=$(cat <<-ENV_CONFIG
ANDROID_HOME=$ANDROID_HOME
ENV_CONFIG
)

SED_ETC_ENVIRONMENT=$(cat <<-SED
/^ANDROID_HOME=/ d
SED
)

# File built from template TEMP_FILE_TEMPLATE
TEMP_FILE=/tmp/environment
# File output of sed
SED_OUTPUT=/tmp/env.tmp
# Target
ENVIRONMENT_TARGET=/etc/environment

echo -e "Appending environment variables to /etc/environment"
sudo rm -f $TEMP_FILE
sudo rm -f $SED_OUTPUT
touch $TEMP_FILE
touch $SED_OUTPUT
sudo echo -e "$TEMP_FILE_TEMPLATE" > $TEMP_FILE
sudo sed -e "$SED_ETC_ENVIRONMENT" $ENVIRONMENT_TARGET > $SED_OUTPUT
sudo cat $TEMP_FILE >> $SED_OUTPUT
sudo chmod 0644 $SED_OUTPUT
sudo chown root:root $SED_OUTPUT
sudo mv -f $SED_OUTPUT $ENVIRONMENT_TARGET
sudo rm -f $TEMP_FILE
sudo rm -f $SED_OUTPUT
