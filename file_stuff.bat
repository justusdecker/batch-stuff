@echo off
set file=./c.bat

call :get_file_info %file%
echo %size%
goto :EOF
:get_file_info
    :: Get File Information e.g. attributes, extension, path and size
    set size=2
    echo attributes: %~a1
    echo drive: %~d1
    echo path: %~p1
    echo extension: %~x1
    echo time: %~t1
    echo Size: %~z1 bytes
    echo extension and filename: %~nx1
    goto :EOF