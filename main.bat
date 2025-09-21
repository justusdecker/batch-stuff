@echo off

:: Create a gameloop
:: In there ask the player: direction to move
:: player walks there
:: generating Map


:opening_msg
    echo -----------------------
    cecho [ :32 1 :0 ] Adventure 
    cecho [ :32 2 :0 ] Farm
    cecho [ :32 3 :0 ] Inventory
    cecho [ :32 4 :0 ] Bank
    pause 2>NUL
    goto opening_msg


for /l %%a in (0,1,10) do (
    cecho :35 %%a :0
)
cecho :31 Hello :32 World :33 ! :0
cecho :31 Hello :32 World :33 ! :0
cecho :31 Hello :32 World :33 ! :0
cecho :31 Hello :32 World :33 ! :0
cecho :31 Hello :32 World :33 ! :0
cecho :31 Hello :33 World :34 ! :0