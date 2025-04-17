@echo off
:: Check if winget is installed
winget --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Winget is not installed on this system. Please install it first.
    pause
    exit /b
)

:: Specify the package name to install
set packageName=jasongin.nvs

:: Install the package
echo Installing %packageName%...
winget install "%packageName%"

:: Check if the installation was successful
if %errorlevel% eq 0 (
    echo %packageName% installed successfully.
) else (
    echo Failed to install %packageName%. Please check the package name and try again.
)

pause
