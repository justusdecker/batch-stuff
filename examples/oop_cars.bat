@echo off
:: Declaring essentials runtime variables
set /a id = 0

call :class_car 240 1200

call :class_car 80 1800

:: You can get the variables by using {id}_{attr_name} so:
echo %_1_id% 
echo %_1_height%
echo %_1_mph%
set /a a=%_1_mph%
set /a b=%_2_mph%
echo %a% %b%
if %a% GTR %b% echo The first car is much faster!


goto :EOF

:func_rnd
    set /a max = %3
    set /a min = %2
    set /a rnd=( %RANDOM% %% (%3 - %2 + 1) ) + %2
    goto :EOF

:class_car
    :: Generic Class in Batch
    ::  (int) a
    ::  (int) b
    :: ...

    :: auto incrementing 
    
    call :idx "class_map"

    :: This is for error handling. Needed?
    ::if [%1] EQU [] echo None
    
    :: set class attributes in {id}_{attr_name} format
    set _%id%_mph=%1
    set _%id%_height=%2

    :: returns with value set
    goto :EOF

    
    :echo_map
        :: ...
        goto :EOF

:idx
    :: This is the autoincrementing id for the classes
    :: must be called in the class initialization
    set /a id+=1
    set _%id%_id=%1
    goto :EOF