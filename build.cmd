setx DOTNET_CLI_TELEMETRY_OPTOUT 1

setlocal

set BAT_DIR=%~dp0

if %PROCESSOR_ARCHITECTURE% == x86 (
    set BIN_DIR=%BAT_DIR%bin\win-x86\
    set BUILD_ARCHITECTURE=win-x86
) 

if %PROCESSOR_ARCHITECTURE% == AMD64 (
    set BIN_DIR=%BAT_DIR%bin\win-x64\
    set BUILD_ARCHITECTURE=win-x64
)

mkdir %BIN_DIR%DirectorySync

dotnet publish %BAT_DIR%src\DirectorySync\DirectorySync.csproj --configuration Release --output "%BIN_DIR%DirectorySync" --runtime %BUILD_ARCHITECTURE%
