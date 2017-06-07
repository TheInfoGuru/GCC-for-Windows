Dim Shell 
Set Shell = CreateObject("wscript.shell") 
Shell.Run ("firefox.exe -silent -setDefaultBrowser") 
Set Shell = Nothing 