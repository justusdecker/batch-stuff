@echo off
:: Declaring essentials runtime variables
set RETURN = ""
set /a id = 0

call :class_generic 50 50

call :class_generic 51 62

:: You can get the variables by using {id}_{attr_name} so:
echo %_2_id% 
echo %_1_height%


goto :EOF

:func_rnd
    set /a max = %3
    set /a min = %2
    set /a rnd=( %RANDOM% %% (%3 - %2 + 1) ) + %2
    goto :EOF

:class_generic
    :: Generic Class in Batch
    ::  (int) a
    ::  (int) b
    :: ...

    :: auto incrementing 
    
    call :idx "class_map"

    :: This is for error handling. Needed?
    ::if [%1] EQU [] echo None
    
    :: set class attributes in {id}_{attr_name} format
    set _%id%_width=%1
    set _%id%_height=%2

    echo w: %1 h: %2 id: _%id%_id

    set RETURN = "%1|%2"
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