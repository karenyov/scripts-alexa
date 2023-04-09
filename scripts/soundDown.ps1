
#Dowload link: https://www.nirsoft.net/utils/nircmd.html
$nircmdPath = "C:\nircmd-x64\nircmd.exe"

# Diminua o volume do sistema em 20 unidades
& $nircmdPath mutesysvolume 0
& $nircmdPath changesysvolume -10000
