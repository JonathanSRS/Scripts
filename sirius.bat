@echo off
color 02
@echo Ola meu nome e sirius
@echo;
@echo Qual seu nome ??
@echo;
set /p name=X 
@echo;
cls
@echo off
@echo Ola %name% o que deseja ?
:menu
 ver
 date /t
 time /t
@echo =====================
@echo * 1. copiar arquivo *
@echo * 2. Abrir arquivo  *
@echo * 3. Buscar arquivo *
@echo * 4. Sair           *
@echo ======================
@echo Escolha uma das opcoes
set /p reposta=X 
if %reposta% equ 1 goto 1
if %reposta% equ 2 goto 2
if %reposta% equ 3 goto 3
if %reposta% equ 4 goto 4
:1 
 @echo informe o atributo do disco
 @echo;
 set /p disco=X 
 @echo;
 @echo qual nome do arquivo senhor(a) %name% ??
 set /p arquivo=X 
 @echo infome o disco de destino
 @echo;
 set /p disco2=X
 @echo ============================
 @echo *DESEJA REALIZAR A OPERA€AO*
 @echo ============================
 pause 
 xcopy %disco%:\%arquivo% %disco2%:\%arquivo%
goto menu 
:2
 @echo Digite o nome do arquivo
 tree /f c:
 tree /f d:
 set /p arqname=X 
 start %arqname%
goto menu
:3
 @echo Senhor(a) %name% digite o nome do arquivo
 set /p busca=X
 @echo;
 @echo por favor infome a unidade onde quer que eu procure o arquivo
 set /p UN=X
 cls
 DIR/B/W/S %UN%:%busca%
 pause
goto menu 
:4
 exit