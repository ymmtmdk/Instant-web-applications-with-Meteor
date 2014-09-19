mv sales_nologin ___sales_nologin___
mv sales ___sales___
mv fotoshare ___fotoshare___
meteor create sales_nologin
meteor create sales
meteor create fotoshare
cd sales_nologin
rm *.html *.js *.css
mv ../___sales_nologin___/* .
cd ..
cd sales
meteor remove insecure autopublish
meteor add accounts-password accounts-ui
rm *.html *.js *.css
mv ../___sales___/* .
cd ..
cd fotoshare
meteor remove insecure autopublish
meteor add accounts-password accounts-ui
rm *.html *.js *.css
mv ../___fotoshare___/* .
cd ..
rmdir ___sales_nologin___ ___sales___ ___fotoshare___
