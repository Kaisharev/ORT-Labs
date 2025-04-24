@echo off

set /p name=Unesite Vaše ime: 
set /p surname=Unesite Vaše prezime: 
set /p email=Unesite Vaš email: 
set /p indexNumber=Unesite Vaš broj indeksa u formatu XXXXGG: 
echo. 
set /p password=Unesite lozinku Vašeg SSH ključa: 

set repositoryName=ort-%indexNumber%

rmdir /s /q SSH > nul 2>&1
rmdir /s /q %repositoryName% > nul 2>&1

mkdir SSH
cd SSH
ssh-keygen -t rsa -b 2048 -f key -N "%password%" > nul
clip < key.pub
cd ..

echo.
echo Vaš javni ključ, koji dodajete u BitBucket, je kopiran!
echo Nakon što dodate ključ, pritisnite bilo koju tipku za nastavak...
pause > nul

echo.
echo Odlično! Kada Vas BitBucket pita za lozinku, unesite lozinku Vašeg SSH ključa.
echo.

mkdir %repositoryName%
cd %repositoryName%
git init > nul
git config --local user.name "%name% %surname%"
git config --local user.email "%email%"
git config --local core.sshCommand "ssh -i ../SSH/key"
git remote add origin git@bitbucket.org:padiketf/%repositoryName%.git
git pull origin master
git branch --set-upstream-to=origin/master master
cd ..

echo.
echo Vaš repozitorijum je kloniran i spreman za korištenje!