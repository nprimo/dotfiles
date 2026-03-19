#!/usr/bin/env bash

export WINEARCH=win32
export WINEPREFIX=$HOME/wine32a

wine "$HOME/wine32a/drive_c/Program Files/Adobe/Adobe Digital Editions 2.0/DigitalEditions.exe"
