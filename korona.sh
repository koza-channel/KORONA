# Pobieranie danych COVID-19 z bazy GUS (Ministerstwa Zdrowia)
# Dodaj do crona i odpalaj korona.txt
# ming@KOZA
curl -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" https://www.gov.pl/web/koronawirus/wykaz-zarazen-koronawirusem-sars-cov-2 | grep "parsedData" | sed 's/,/\n/g' | sed 's/"//g' | sed 's/{//g' | sed 's/ó/o/g' | grep "data" > co.txt
iconv -f UTF-8 -t ISO-8859-1//TRANSLIT co.txt -o co2.txt
rm korona.txt
echo "Dokladne statystyki COVID-19 dla Polski (infekcje/zgony):" > korona.txt
cat co2.txt | sed 's/^.*Cala/Cala/' | sed 's/;/ /g' | sed 's/\\//g' | sed 's/rn/<> /g' | sed 's/t01//g' | sed 's/t02//g' | sed 's/t03//g'| sed 's/t04//g' | sed 's/t05//g' | sed 's/t06//g' | sed 's/t07//g' | sed 's/t08//g' | sed 's/t09//g' | sed 's/t10//g' | sed 's/t00//g' | sed 's/t11//g' | sed 's/t12//g' | sed 's/t13//g' | sed 's/t14//g' | sed 's/t15//g' | sed 's/t16//g' | sed 's/t17//g' | sed 's/t18//g' | sed 's/t19//g' | sed 's/t20//g' | sed 's/t21//g' | sed 's/t22//g' | sed 's/t23//g' | sed 's/t24//g' | sed 's/t25//g' | sed 's/t26//g' | sed 's/t27//g' | sed 's/t28//g' | sed 's/t29//g' | sed 's/t30//g' | sed 's/t31//g' | sed 's/t32//g' | sed 's/kie/kie:/g' | sed 's/ska/ska:/g' | rev | cut -c2- | rev >> korona.txt
[ -s korona.txt ] || echo 'Problem z polaczeniem z baza danych GUS. Sprobuj ponownie za 10 min.' > korona.txt
