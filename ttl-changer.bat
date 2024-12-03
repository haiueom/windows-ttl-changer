@echo off
title Windows TTL Changer - haiueom
color 0a

:: Check if running as administrator
if not "%1"=="am_admin" (
  echo [!] Not running as administrator
  echo [*] Requesting administrator access...
  timeout 2 > NUL
  powershell -Command "Start-Process -Verb RunAs -FilePath '%~f0' -ArgumentList 'am_admin'"
  goto EOF
)

:MENU
	CLS
	:: Get current TTL value from localhost
	for /f "tokens=6" %%i in ('ping -n 1 127.0.0.1^|find "TTL"') do set ttl="%%i"

	:: Display current TTL value
	echo --------------------------------------------------------------
	echo Current TTL: %ttl%
	echo --------------------------------------------------------------
	echo.
	echo [1] 65 (bypass)
	echo [2] 128 (default)
	echo [3] Exit
	echo.

	:: Get user input
	CHOICE /C 123 /N /M "[?] Choose an option: "
  echo.

	:: Process the choice
  if errorlevel 3 set M=3
  if errorlevel 2 set M=2
  if errorlevel 1 set M=1

  :: Redirect based on user input
  if "%M%"=="1" goto BYPASS
  if "%M%"=="2" goto DEFAULT
  if "%M%"=="3" goto EOF

  :: Default exit in case of unexpected input
  echo [!] Invalid choice. Exiting...
  goto EOF

:: TTL set to 65 (bypass) & back to menu
:BYPASS
  :: Set TTL to 65 for IPv4 and IPv6
  echo [*] Setting TTL to 65 (bypass)...
  netsh int ipv4 set glob defaultcurhoplimit=65 > NUL
  netsh int ipv6 set glob defaultcurhoplimit=65 > NUL

  :: Prefer IPv4 over IPv6
  :: Reference: https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/configure-ipv6-in-windows
  echo [*] Configuring preference for IPv4 over IPv6...
  reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 32 /f > NUL

  :: Inform user about the change
  echo.
  echo [✓] TTL set to 65 (bypass) successfully.
  echo [!] Restart now for best results.
  timeout 5 > NUL

  :: Return to the main menu
  goto MENU

:: TTL set to 128 (default value) & back to menu
:DEFAULT
  :: Set TTL to 128 for IPv4 and IPv6
  echo [*] Setting TTL to 128 (default value)...
  netsh int ipv4 set glob defaultcurhoplimit=128 > NUL
  netsh int ipv6 set glob defaultcurhoplimit=128 > NUL

  :: Revert preference for IPv4 over IPv6
  :: Reference: https://docs.microsoft.com/en-us/troubleshoot/windows-server/networking/configure-ipv6-in-windows
  echo [*] Reverting preference for IPv4 over IPv6...
  reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /f > NUL

  :: Inform user about the change
  echo.
  echo [✓] TTL set to 128 (default value) successfully.
  echo [!] Restart now for best results.
  timeout 5 > NUL

  :: Return to the main menu
  goto MENU

:EOF
  exit /b
