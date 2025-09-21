@echo off
set file=./c.bat

call :get_file_info %file%
echo %size%
goto :EOF
:get_file_info
    :: Get File Information e.g. attributes, extension, path and size
    set size=2
    echo attributes: %~a0
    echo drive: %~d1
    echo path: %~p0
    echo extension: %~x0
    echo time: %~t0
    echo Size: %~z0 bytes
    echo extension and filename: %~nx0
    goto :EOF