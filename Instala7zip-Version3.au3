#RequireAdmin
;Comprobar si ya está Instalado
if Programa7zipInstalado() Then
   Exit
EndIf

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

Func Programa7zipInstalado()
   Local $Resp=False
   Local $Reg=""
   if @OSArch="X64" Then
	  $Reg=RegRead('HKLM64\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{23170F69-40C1-2702-1604-000001000000}',"DisplayName")
   Else
	  $Reg=RegRead('HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{23170F69-40C1-2702-1604-000001000000}',"DisplayName")
   EndIf
   if StringInStr($Reg,'7-Zip 16.04') then
	  $Resp=True
   EndIf
   Return $Resp
EndFunc