#!/bin/zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open Calendar in Chrome
# @raycast.mode compact
#
# Optional parameters:
# @raycast.icon 📅
 
open -na 'Google Chrome' --args --profile-directory="Profile 1" 'https://calendar.google.com/calendar/u/0/r/week'
