setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build && cd build

if "%1"=="cli" (set cli=1) else (set cli=0)

if "%1"=="gui" (set gui=1) else (set gui=0)

echo "cli is" %cli% "and gui is" %gui%

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
      -D PRISMATIC_ENABLE_CLI=%cli% ^
      -D PRISMATIC_ENABLE_GUI=%gui% ^
      -D PRISMATIC_ENABLE_GPU=0 ^
      -D PRISMATIC_ENABLE_DOUBLE_PRECISION=0 ^
      -D HDF5_DIR=%LIBRARY_PREFIX%\cmake\hdf5 ^
      -D Qt5Widgets_DIR=%LIBRARY_PREFIX%\lib\cmake\Qt5Widgets ^
      -D CMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
      -D CMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
      -D CMAKE_BUILD_TYPE=Release ^
      %SRC_DIR%
if errorlevel 1 exit 1

:: Build!
nmake
if errorlevel 1 exit 1

:: Install!
nmake install
if errorlevel 1 exit 1
