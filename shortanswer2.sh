#Adapted code for Short Answer 2

for file in Sequence*
do
        ../../muscle3.8.31_i86linux64 -in $file -out $file-align
done

#Construct 2 protein models using hmm build

for file in *.fasta-align
do
        ../../local/bin/hmmbuild $file.hmm $file
done

#Ran shell script in directory with only Control1 file and the two sequence files (for proteins Yc2 and Lhx2)

RNAfiles=$(ls *| grep ^[CO])

echo $RNAfiles

for file in *.hmm
do
  	echo $file
        for bio in $RNAfiles
        do
          	../../local/bin/hmmsearch --tblout ShortAnswer2HMM.csv $file $bio
                a=$(cat $bio | grep -v "#" | wc -l echo ShortAnswer2HMM.csv | grep -v "total")
                b=$(echo $bio $file)
                echo $a $b >> ShortAnswer2.csv
         done
done

