
:: https://github.com/jkriege2/JKQtPlotter/issues/35
set "CXXFLAGS= -MD"
set "CMAKE_GENERATOR=Ninja"

echo CUDA_HOME: %CUDA_HOME%
echo CUDA_PATH: %CUDA_PATH%

set "CUDA_PATH=C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v%cuda_compiler_version%"

echo CUDA_PATH (after): %CUDA_PATH%

if "%cuda_compiler_version%" == "None" (
	%PYTHON% setup.py build_ext ^
			-DHDF5_DIR=%LIBRARY_PREFIX%\cmake\hdf5 ^
			-DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
			-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
			install
	if errorlevel 1 exit 1) else (
	%PYTHON% setup.py build_ext ^
			-DHDF5_DIR=%LIBRARY_PREFIX%\cmake\hdf5 ^
			-DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
			-DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
			install  --enable-gpu
	if errorlevel 1 exit 1
)
