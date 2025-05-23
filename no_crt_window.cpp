#include <windows.h>
#include <stdio.h>
#include <math.h>

#pragma comment (lib, "kernel32")
#pragma comment (lib, "user32")

extern "C" int WinMainCRTStartup()
{
	char buffer[50];
	snprintf(buffer, sizeof(buffer), "Hello %s! COS: %f\n", "World", cosf(1.0f));

	MessageBoxA(0, buffer, "Example", 0);

	return 0;
}