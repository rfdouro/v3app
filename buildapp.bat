
:: usado para alterar o path indicado no vite.config.js
SET NODE_ENV=mobile

rmdir /s /q android

::troque vcap pelo nome do app e com.rfdouro.vcap pelo nome com o pacote usado
call npx cap init vcap com.rfdouro.vcap --web-dir=dist

call npm run build

call npx cap add android

call npx @capacitor/assets generate

cd android

gradlew assembleDebug

cd ..