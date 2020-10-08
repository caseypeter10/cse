@echo off
cmake -P cmake/configure.cmake
if ERRORLEVEL 1 exit /B

echo %errorlevel%
if %errorlevel% EQU 0 (
  cmake -P cmake/build.cmake
)
IF "%1"=="" (
  PAUSE
)
