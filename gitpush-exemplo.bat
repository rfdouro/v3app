set now=%date:~6,4%_%date:~3,2%_%date:~0,2%_%time:~0,2%:%time:~3,2%
echo.%now%


if exist .git\ (
 echo Ok
) else (
 git init
)

git config user.name "NOME_USUARIO"
git config user.email "USUARIO@MAIL.COM"

@echo off
set /p messComit=Qual a mensagem de commit?: 

git add -A
git commit -m "%messComit% %now%"
git push -f https://<TOKEN_DE_SEGURANCA>@github.com/<USUARIO_GITHUB>/<REPOSITORIO>.git master


:: PROCESSO DE BUILD

:: usado para alterar o path indicado no vite.config.js
SET NODE_ENV=production

call npm run build
cd dist

:: PUSH PARA GHPAGES

git init
git config user.name "NOME_USUARIO"
git config user.email "USUARIO@MAIL.COM"
git add -A
git commit -m "push ghpages %now%"
git push -f https://<TOKEN_DE_SEGURANCA>@github.com/<USUARIO_GITHUB>/<REPOSITORIO>.git master:gh-pages


cd ..
