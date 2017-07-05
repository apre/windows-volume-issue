FROM python:3.6.1-windowsservercore

# declare the volume holding the source-tree beeing edited
VOLUME c:/dev

# for the test, copy the source tree locally
ADD dev-files c:\local
SHELL ["powershell"]
