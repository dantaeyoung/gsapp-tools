#!/bin/bash

curl -s --form-string "token=abW2tNR74rswHAwFiqtnA8JGFdeqJw" --form-string "user=umU7TZcdKEVq947QwtoSxcXP3jMeFS" \
	--form-string "message=GSAPP SCHEDULE DIFF!" \
	https://api.pushover.net/1/messages.json
