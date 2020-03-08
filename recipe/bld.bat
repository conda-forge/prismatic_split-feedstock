setlocal EnableDelayedExpansion

:: Make a build folder and change to it.
mkdir build && cd build

:: Configure using the CMakeFiles
cmake -G "NMake Makefiles" ^
      -D PRISMATIC_ENABLE_CLI=1 ^
      -D PRISMATIC_ENABLE_GUI=1 ^
      -D PRISMATIC_ENABLE_GPU=0 ^
      -D PRISMATIC_ENABLE_DOUBLE_PRECISION=1 ^
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
