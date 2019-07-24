start chrome /new-window http://localhost:1313
if exist %~dp0\public rd /q /s %~dp0\public
hugo server -D

