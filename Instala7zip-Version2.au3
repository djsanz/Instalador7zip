#RequireAdmin
;Extrayendo MSI Instalador
if @OSArch="X86" Then
   FileInstall("7z1604.msi",@TempDir & '\7z.msi')
Else
   FileInstall("7z1604-x64.msi",@TempDir & '\7z.msi')
EndIf

;Ejecutando comando
RunWait(@ComSpec & ' /c msiexec /i "' & @TempDir & '\7z.msi" /quiet /norestart',@TempDir,@SW_HIDE)

;Borrando MSI Instalador
FileDelete(@TempDir & '\7z.msi')