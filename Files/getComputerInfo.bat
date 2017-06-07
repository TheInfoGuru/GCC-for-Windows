@echo off
REM Windows Batch File to collect information about system, and files & dirs in current directory
REM - useful for debugging issues
REM - compare results using diff tool (like kdiff or vimdiff) between machines where issue occurs and does not occur
REM Written by Darcy Parker - darcyparker@gmail.com - 3/28/2013 and updated periodically since then.
REM - See https://gist.github.com/darcyparker/5264774 for updates.
REM Depends on md5sum.exe from http://gnuwin32.sourceforge.net/packages/coreutils.htm
setlocal

REM Get the current directory name
call :getDirFileName "%CD%"
set "saveLocation=%appdata%\temp\logs\"
echo INFO: Saving output to files in: "%saveLocation%"
if NOT EXIST "%saveLocation%" mkdir "%saveLocation%"
if NOT EXIST "%saveLocation%" (
  echo ERROR: Could not create directory "%saveLocation%"
  goto :end
)

::echo INFO: Getting system info ...
::echo System Info for Computer: %COMPUTERNAME%> "%saveLocation%\systeminfo_%COMPUTERNAME%.txt"
::echo Current Date and Time: %DATE% %TIME%>> "%saveLocation%\systeminfo_%COMPUTERNAME%.txt"
::echo ================================================================================>>"%saveLocation%\systeminfo_%COMPUTERNAME%.txt"
::systeminfo >> "%saveLocation%\systeminfo_%COMPUTERNAME%.txt"

::echo INFO: Getting current user name and their sid
::echo ================================================================================>"%saveLocation%\userinfo_%username%_%COMPUTERNAME%.txt"
::echo User: %username%>>"%saveLocation%\userinfo_%username%_%COMPUTERNAME%.txt"
::wmic useraccount where name='%username%' get sid >>"%saveLocation%\userinfo_%username%_%COMPUTERNAME%.txt"

echo INFO: Looking up IE Version
echo ================================================================================>"%saveLocation%\IEVersionInfo_%username%_%COMPUTERNAME%.txt"
REM See http://support.microsoft.com/kb/969393
REM Test if svcVersion key is present. If it is present, then it is IE10 or
REM later.  Otherwise rely on Version key
%windir%\system32\reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer" /v svcVersion >NUL 2>NUL
if not ErrorLevel 1 (
  for /f "usebackq tokens=3" %%i in (`%windir%\system32\reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer" /v svcVersion ^| %windir%\system32\findstr /i /l /c:"REG_SZ"`) do set _IEVersion=%%i
) else (
  REM svcVersion KEY NOT Found. Must be IE9 or earlier so use Version Key
  for /f "usebackq tokens=3" %%i in (`%windir%\system32\reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer" /v Version ^| %windir%\system32\findstr /i /l /c:"REG_SZ"`) do set _IEVersion=%%i
)
echo Found IE Version=%_IEVersion%>>"%saveLocation%\IEVersionInfo_%username%_%COMPUTERNAME%.txt"
REM Get IE major version
for /f "tokens=1 Delims=." %%i in ("%_IEVERSION%") do set _IEMajorVersion=%%i
echo IE Major version: %_IEMajorVersion%>>"%saveLocation%\IEVersionInfo_%username%_%COMPUTERNAME%.txt"

echo INFO: Getting current task list ...
echo Task List for User: %USERNAME%> "%saveLocation%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
echo on Computer: %COMPUTERNAME%>> "%saveLocation%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%saveLocation%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
echo ================================================================================>>"%saveLocation%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"
tasklist /v >> "%saveLocation%\tasklist_%COMPUTERNAME%_%USERNAME%.txt"

::echo INFO: Getting registry info ... (This can take up to a minute)
::reg export HKEY_CLASSES_ROOT "%saveLocation%\reginfo_%COMPUTERNAME%-HKEY_CLASSES_ROOT.txt" /y
::reg export HKEY_CURRENT_USER "%saveLocation%\reginfo_%COMPUTERNAME%-HKEY_CURRENT_USER.txt" /y
::reg export HKEY_LOCAL_MACHINE "%saveLocation%\reginfo_%COMPUTERNAME%-HKEY_LOCAL_MACHINE.txt" /y
::reg export HKEY_USERS "%saveLocation%\reginfo_%COMPUTERNAME%-HKEY_USERS.txt" /y
::reg export HKEY_CURRENT_CONFIG "%saveLocation%\reginfo_%COMPUTERNAME%-HKEY_CURRENT_CONFIG.txt" /y

echo INFO: Getting current environment variable settings ... (This will take up to 5 minutes)
echo Environment Variable Listing for User: %USERNAME%> "%saveLocation%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
echo on Computer: %COMPUTERNAME%>> "%saveLocation%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
echo Current Date and Time: %DATE% %TIME%>> "%saveLocation%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
echo ================================================================================>>"%saveLocation%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"
set >> "%saveLocation%\environmentvariables_%COMPUTERNAME%_%USERNAME%.txt"

::echo INFO: Getting Internet Explorer Compat Data
::echo Getting Internet Explorer Compatability Data from: "%LOCALAPPDATA%\Microsoft\Internet Explorer\IECompatData\iecompatdata.xml"> "%saveLocation%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
::echo on Computer: %COMPUTERNAME%>> "%saveLocation%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
::echo Current Date and Time: %DATE% %TIME%>> "%saveLocation%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
::echo ================================================================================>>"%saveLocation%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"
::copy "%LOCALAPPDATA%\Microsoft\Internet Explorer\IECompatData\iecompatdata.xml" "%saveLocation%\iecompatdata_%COMPUTERNAME%_%USERNAME%.txt"


:getJavaInfo
echo INFO: Getting information about Java ...
echo Java Information on Computer: %COMPUTERNAME%> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo ================================================================================>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo Java JDKs installed:>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Development Kit" /s >>  "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo Java JREs installed:>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment" /s >>  "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo Where is java.exe?>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
where java >> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo Java.exe version information:>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
java -version 2>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo Java related environment variables (may not be set):>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo   %%JAVA_HOME%%=%JAVA_HOME%>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo   %%CLASSPATH%%=%CLASSPATH%>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo Folders under "%%PROGRAMFILES%%\Java":>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
dir /b "%PROGRAMFILES%\Java" >> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo.>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
echo Folders under "%%ProgramFiles(x86)%%\Java":>> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
dir /b "%ProgramFiles(x86)%\Java" >> "%saveLocation%\javainfo_%COMPUTERNAME%.txt"
REM %_whereiscommand% is set to the location of md5sum.exe from before
REM This section is commented out because it takes a long time to run if md5sum.exe exists and I don't always
REM need it.

REM SCRIPT FINISHED
goto :end

REM ============================================================================
REM Methods called by script
REM ============================================================================

  REM Method to get the Dir or File Name from first parameter passed to it
  REM Remember to wrap parameter with spaces in double quotes.
  :getDirFileName
    set _getDirFileName=%~n1
    goto :eof

  REM whereiscommand Finds a command in path environment variable
  REM First param is command name to search for
  :whereiscommand
    set _whereiscommand=
    for /F "usebackq delims==" %%z IN (`where %1`) DO call :__whereiscommand %%z
    goto :eof
    REM __whereiscommand is meant to be an Internal command that only sets %_whereiscommand% if it is not set already
    REM This way the first found in `where %1` takes precedence
    :__whereiscommand
      if /I "x%_whereiscommand%" EQU "x" (
        set _whereiscommand=%1
      )
      goto :eof

:end
endlocal