@echo off

set windows=0
set cpp=0

cls
where /q cl || call "C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

rmdir /s /q build
mkdir build

@REM Build options
set obj_output=/Fo".\\build\\"
set disable_buffer_security_check=/GS-

set build_options=/nologo %obj_output% %disable_buffer_security_check%

@REM Linker options
set windows_libs=libvcruntime.lib ucrt.lib

if %windows% equ 1 (
  set subsystem=/subsystem:windows
)

if %windows% equ 0 (
  set subsystem=/subsystem:console
)

set linker_options=/incremental:no %subsystem% /out:build\main.exe

if %windows% equ 1 if %cpp% equ 1 (
  set filename=no_crt_window.cpp
)

if %windows% equ 0 if %cpp% equ 1 (
  set filename=no_crt_console.cpp
)

if %windows% equ 1 if %cpp% equ 0 (
  set filename=no_crt_window.c
)

if %windows% equ 0 if %cpp% equ 0 (
  set filename=no_crt_console.c
)

cl %build_options% %filename% /link %linker_options% %windows_libs%

build\main

@REM (Optional) Check imported functions on the executable
@REM dumpbin /nologo /imports build\main.exe