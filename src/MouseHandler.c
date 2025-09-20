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
    
    // Setzt nur die grundlegenden Flags, die für die Maus-Eingabe notwendig sind
    SetConsoleMode(hInput, ENABLE_EXTENDED_FLAGS | ENABLE_MOUSE_INPUT);

    printf("Waiting for mouse clicks or key presses. Press ESC to exit.\n");
    printf("Debug: The console is in raw input mode.\n");
    
    while (1) {
        ReadConsoleInput(hInput, &inputRecord, 1, &eventsRead);

        // Debugging: Print the type of event we received
        // 1: KEY_EVENT, 2: MOUSE_EVENT, 4: WINDOW_BUFFER_SIZE_EVENT
        printf("Received event type: %d\n", inputRecord.EventType);

        if (inputRecord.EventType == MOUSE_EVENT) {
            if (inputRecord.Event.MouseEvent.dwButtonState == FROM_LEFT_1ST_BUTTON_PRESSED) {
                printf("Clicked at X: %d, Y: %d\n",
                       inputRecord.Event.MouseEvent.dwMousePosition.X,
                       inputRecord.Event.MouseEvent.dwMousePosition.Y);
            }
        } else if (inputRecord.EventType == KEY_EVENT) {
            if (inputRecord.Event.KeyEvent.bKeyDown && inputRecord.Event.KeyEvent.wVirtualKeyCode == VK_ESCAPE) {
                printf("ESC pressed. Exiting loop.\n");
                break;
            }
        }
    }

    SetConsoleMode(hInput, mode);

    printf("Press any key to close the window...\n");
    _getch();
    return 0;
}