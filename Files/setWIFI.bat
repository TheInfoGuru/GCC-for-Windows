copy /z \\10.1.10.13\tk\crwlan.xml "%appdata%\temp"
netsh wlan add profile filename="%appdata%\temp\crwlan.xml"