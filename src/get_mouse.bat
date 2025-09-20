
for /f "tokens=1,2 delims= " %%x in ('mhndl.exe') do (
    cecho :31 NICE :0
    set "x_coord=%%x"
    set "y_coord=%%y"
) 

pause