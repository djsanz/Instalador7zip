#RequireAdmin
;Extrayendo MSI Instalador
FileInstall("7z1604.msi",@TempDir & '\7z.msi')

;Ejecutando comando
RunWait(@ComSpec & ' /c msiexec /i "' & @TempDir & '\7z.msi" /quiet /norestart',@TempDir,@SW_HIDE)

;Borrando MSI Instalador
FileDelete(@TempDir & '\7z.msi')