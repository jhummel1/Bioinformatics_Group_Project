#Using Unix commands or R/Python, make a single table that includes the 
#top hit for each transcript

for file in *.csv
do
	cat $file | head -n 1 >> tophits.csv
done
