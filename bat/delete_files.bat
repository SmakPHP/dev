@echo off

rem Deletes files with selected extensions in the specified directory

setlocal enabledelayedexpansion

set "target_dir=C:\Laragon\www\test.ru"
set "extensions=jpg jpeg gif raw webp png tiff tif svg svgz pdf bmp ico"

for %%e in (%extensions%) do (
    for /r "%target_dir%" %%f in (*.%%e) do (
        rem echo "%%f"
        del "%%f"
    )
)

echo Deletion complete.
pause
