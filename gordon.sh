#!/bin/bash

export RAMSAY_INSULTS="$HOME/.dotfiles/ramsayinsults"
export PROMPT_COMMAND="gordonprompt; $PROMPT_COMMAND"

# play_ramsay_insult
#
# Function should run a media player capable of handling mp3 files
# quietly as a background job. On OSX (ugh gross), the following function
# should be used instead. Make sure coreutils is installed for the 'gshuf'
# command.
#
#	function play_ramsay_insult()
#	{
#		local randominsult="$(ls "$RAMSAY_INSULTS" | gshuf -n1)"
#		afplay "$RAMSAY_INSULTS/$randominsult" &
#		disown "$!"
#	}
#
function play_ramsay_insult()
{
	local randominsult="$(ls "$RAMSAY_INSULTS" | shuf -n1)"
	mpv --really-quiet "$RAMSAY_INSULTS/$randominsult" &
	disown "$!"
}


# gordonprompt
#
# Called on every new promptline via PROMPT_COMMAND.
#
function gordonprompt()
{
	[ "$?" != "0" ] && play_ramsay_insult
}

