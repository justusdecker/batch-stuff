@echo off
setlocal enabledelayedexpansion

:generate_map
    :: A chunk is 16x16
    :: Generates
    mkdir .\map
    
    echo %map% >map.txt
    for /l %%a in (-10,1,10) do (
        for /l %%b in (-10,1,10) do (
            call :generate_chunk 15 15
            call :generate_map_data %%a %%b
        )

    )
    ::cecho :35 %%a :34 %%b :0
:generate_chunk
    set map = ""
    for /l %%c in (0,1,%1) do (
        for /l %%c in (0,1,%2) do (
            set map=!map!0
    
        )
    
    )
    echo !map! >map.txt

:generate_map_data
    echo %1 %2

    :: Generate
    :: - biome
    :: - random set gras
    :: - random spreaded npcs, trees, rocks etc.

    echo bla >.\map\%1_%2.txt