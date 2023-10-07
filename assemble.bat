:: in order to enable "comparsion with previous version" and "restoring backup" functions
:: make 2 copies of <!superc.nes> and rename them as <!superc.old> and <!superc.bak>

:: disable unnecessary console messages if possible
echo off

:: create a copy of previous compiled version
if exist !superc.old (copy !superc.nes !superc.old)

:: launch preparation script and wait until finished
start /wait lua53 preparations.lua

:: -U = no need to use .import
:: -l = create listing file
:: -g = create debug file
ca65 -U -l copy_bank_20.lst -g copy_bank_20.asm
ca65 -U -l copy_bank_22.lst -g copy_bank_22.asm
ca65 -U -l copy_bank_24.lst -g copy_bank_24.asm
ca65 -U -l copy_bank_26.lst -g copy_bank_26.asm
ca65 -U -l copy_bank_28.lst -g copy_bank_28.asm
ca65 -U -l copy_bank_2A.lst -g copy_bank_2A.asm
ca65 -U -l copy_bank_2C.lst -g copy_bank_2C.asm
ca65 -U -l copy_bank_2E.lst -g copy_bank_2E.asm
ca65 -U -l copy_bank_30.lst -g copy_bank_30.asm
ca65 -U -l copy_bank_32.lst -g copy_bank_32.asm
ca65 -U -l copy_bank_33.lst -g copy_bank_33.asm
ca65 -U -l copy_bank_34.lst -g copy_bank_34.asm
ca65 -U -l copy_bank_36.lst -g copy_bank_36.asm
ca65 -U -l copy_bank_38.lst -g copy_bank_38.asm
ca65 -U -l copy_bank_3A.lst -g copy_bank_3A.asm
ca65 -U -l copy_bank_3C.lst -g copy_bank_3C.asm
ca65 -U -l copy_bank_3E.lst -g copy_bank_3E.asm

:: assemble code into binaries
ld65 -C ld65.cfg -o PRG_ROM.bin --dbgfile _debug.txt ^
    copy_bank_20.o ^
    copy_bank_22.o ^
    copy_bank_24.o ^
    copy_bank_26.o ^
    copy_bank_28.o ^
    copy_bank_2A.o ^
    copy_bank_2C.o ^
    copy_bank_2E.o ^
    copy_bank_30.o ^
    copy_bank_32.o ^
    copy_bank_33.o ^
    copy_bank_34.o ^
    copy_bank_36.o ^
    copy_bank_38.o ^
    copy_bank_3A.o ^
    copy_bank_3C.o ^
    copy_bank_3E.o

:: join header, prg and chr into a single ROM file
copy /B header.bin + PRG_ROM.bin + CHR_ROM.chr superc.nes

:: join listing files into a single file
copy /A copy_*.lst _listing.txt

:: delete leftover garbage and copies
del *.o + PRG_ROM.bin + copy_*

:: create a copy of .nl file for original ROM
if exist original_rom.nes (copy !superc.nes.ram.nl original_rom.nes.ram.nl)

:: check file size and display corresponding message
setlocal enableextensions
FOR %%A IN ("!superc.nes") DO set "size=%%~zA"
if %size% EQU 524304 (
    echo.
    echo -----------------------------------------------
    echo Done! Look for !superc.nes file in your folder.
    if exist !superc.bak (
        echo.
        fc /A /B /T !superc.nes !superc.bak > nul && echo Perfect match || echo Differences found 
        echo.
        copy !superc.nes !superc.bak
        echo Backup created
    )
    echo -----------------------------------------------
    pause
) else (
    echo.
    echo --------------------------------------------------
    echo Something's wrong, check log for more information. 
    if exist !superc.bak (
        echo.
        copy !superc.bak !superc.nes
        echo Backup restored
    )
    echo --------------------------------------------------
    echo.
    pause
)