#For each of the 6 transcripts make a muscle alignment from your downloaded protein se$

#for file in sequence*
#do
#	../muscle3.8.31_i86linux64 -in $file -out $file-align
#done

#Construct 6 HMM protein models using hmm build

#for file in *.fasta-align
#do
#	../local/bin/hmmbuild $file.hmm $file
#done

#Search all 4 translated RNAseqfiles for each of the 6 HMM models using hmmsearch

RNAfiles=$(ls *| grep ^[CO])

echo $RNAfiles

for file in *.hmm
do
  	echo $file
        for bio in $RNAfiles
        do
                ../local/bin/hmmsearch --tblout $bioResultsHMM.csv $file $bio
        done
done





