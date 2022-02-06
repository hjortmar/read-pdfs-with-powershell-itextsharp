# Running Powershell scripts with UiPath

Hello!

This project is mean't to demonstrate how you can get UiPath to run Powershell scripts.

The shared suggestions that I could find elsewhere weren't pretty and Invoke Powershell can deal with simple scripts but it is clunky and lacks control. You are (afaik) also forced to run the script within the context of UiPath, which is not always ideal. 

Being the lazy person that I am.. I also wanted to be able to avoid creating a fairly simple but long story in UiPath to do something that would otherwise be 5-10 lines of code.

### Con ###
UiPath will not automagically log the outcome of your script, it will wait for the script to complete but you will need to deal with the logs and/or include ways of confirmation of your desired outcome in your script when you need to be thorough (which should be always).

### Pro ###
The ability to make use of modules and scripts made by people with big IQs for your UiPath projects and the scripts do not need to be run within the context of UiPath. Huge.


WIP
