:: Declaring essentials runtime variables

set RETURN = ""
set RETURN = ""

for /l %%a in (0,1,5) do (
        call :func_rnd 2 10 20
        echo !rnd!
    )

::call :class_map 1 50 50

:OutOfFrameExeception
    :: After this the application will overwrite unwanted values, so we catch this and goto EOL
    echo "Reached the allowed Frame & quit for safety reason"
    goto :EOL


:func_rnd
    set /a max = %3
    set /a min = %2
    set /a rnd=( %RANDOM% %% (%3 - %2 + 1) ) + %2
    goto :RETURN

:class_map
    :: Generates a map
    ::  (int) id
    ::  (int) width
    ::  (int) height
    :: 1. Generate a 50 * 50 Map
    :: 2. For each Step generate a tile 0 or 1
    :: 3. Smooth out the map
    :: 4. print out the map

    if [%1] EQU [] echo None
    
    
    set %1_width = %2
    set %1_height = %3

    for /l %%a in (0,1,%2) do (
    for /l %%b in (0,1,%3) do (
        echo %%a_%%b
    )
    )
    call :
    goto :EOF

    :: callback via the id
    :echo_map
        :: ...
    

:class_entity
    :: This setups an entity
    :: At first it sets the id temp

    set id = %1
    if [%1] EQU [] echo None
    
    :: callback via the id
    set %id%_name = %2
    set %id%_hp = %3
    set %id%_atk = %4
    set %id%_def = %5

:EOL
    echo "App reached EOL..."
:RETURN
    echo "returned from %1"