#!/bin/bash

i3lock -i $(cat $HOME/.fehbg | tail -1 | awk '{print $3}' | tr -d "'") 
