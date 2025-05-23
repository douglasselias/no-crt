#include <windows.h>
#include <stdio.h>
#include <math.h>

#pragma comment (lib, "kernel32")
#pragma comment (lib, "user32")

int mainCRTStartup()
{
	char buffer[50];
	snprintf(buffer, sizeof(buffer), "Hello %s! COS: %f\n", "World", cosf(1.0f));
  
  HANDLE stdout = GetStdHandle(STD_OUTPUT_HANDLE);
  WriteFile(stdout, buffer, strlen(buffer), NULL, NULL);

	return 0;
}