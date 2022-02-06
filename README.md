# Running Powershell scripts with UiPath

Hello!

This project is meant to demonstrate how you can get UiPath to run Powershell scripts.

You have probably read other guides for this purpose but it is simply clunky to deal with through UiPath and it is run through the context of UiPath which I did recognize to be reliable. It might have been my fault, I just felt that the flexibility is not there.. atleast not yet.
 
Being the lazy person that I am.. instead of creating a long story in UiPath for something that would be 5-10 lines in a script, I had to scratch that itch.

### Con ###
UiPath will not know that you are running a script with the exception that it waits for the script to complete so you possibly need to add lines to the logs and/or include ways of confirmation in your scripts.

### Pro ###
The ability to make use of modules and scripts made by people with big IQs for your projects and the scripts do not need to be run within the context of UiPath. Huge.


WIP
