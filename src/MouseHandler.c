#include <stdio.h>
#include <windows.h>
#include <conio.h>

int main(void) {
    HANDLE hInput;
    DWORD mode;
    INPUT_RECORD inputRecord;
    DWORD eventsRead;

    hInput = GetStdHandle(STD_INPUT_HANDLE);
    if (hInput == INVALID_HANDLE_VALUE) {
        fprintf(stderr, "Failed to get console handle.\n");
        return 1;
    }

    GetConsoleMode(hInput, &mode);
    
    // Sets only the Flags that are needed to get the mouse input
    SetConsoleMode(hInput, ENABLE_EXTENDED_FLAGS | ENABLE_MOUSE_INPUT);
    // Waiting for mouse clicks or key presses. Press ESC to exit.
    // 
    
    while (1) {
        ReadConsoleInput(hInput, &inputRecord, 1, &eventsRead);
        // Debugging: Print the type of event we received
        // 1: KEY_EVENT, 2: MOUSE_EVENT, 4: WINDOW_BUFFER_SIZE_EVENT

        if (inputRecord.EventType == MOUSE_EVENT) {
            if (inputRecord.Event.MouseEvent.dwButtonState == FROM_LEFT_1ST_BUTTON_PRESSED) {
                printf("%d %d\n",
                       inputRecord.Event.MouseEvent.dwMousePosition.X,
                       inputRecord.Event.MouseEvent.dwMousePosition.Y);
                break;
            }
        } else if (inputRecord.EventType == KEY_EVENT) {
            if (inputRecord.Event.KeyEvent.bKeyDown && inputRecord.Event.KeyEvent.wVirtualKeyCode == VK_ESCAPE) {
                break;
            }
        }
    }

    SetConsoleMode(hInput, mode);
    return 0;
}