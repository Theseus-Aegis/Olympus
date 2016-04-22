@echo off

rem Add dummy "theirs" git merge strategy driver
git config merge.theirs.driver true

rem Print newly set git merge strategy driver config
echo Dummy 'theirs' merge strategy driver added
git config merge.theirs.driver

rem Final note
echo Above line should be: true

rem Press any key to continue...
pause
