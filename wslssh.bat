@echo off

setlocal enabledelayedexpansion

set "currentdir=%cd:\=\\%"

rem Enable interactive mode by default.
rem And disable it by set Windows environment variale WSLSSH_USE_INTERACTIVE_SHELL to 0 or false
set "bashic=true"
if [%WSLSSH_USE_INTERACTIVE_SHELL%] == [0] set bashic=false
if [%WSLSSH_USE_INTERACTIVE_SHELL%] == [false] set bashic=false

if [%1] == [] goto WITHOUT_ARGS

:WITH_ARGS
	set args=%*
	set "args=%args:\=\\%"

	if %bashic% == true (
		wsl zsh -ic 'sshpass -e ssh %args%'
	) else (
		wsl ssh %args%
	)
	exit /b %errorlevel%

:WITHOUT_ARGS
	if %bashic% == true (
		wsl zsh -ic 'ssh'
	) else (
		wsl ssh
	)
	exit /b %errorlevel%
