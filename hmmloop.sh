#For each of the 6 transcripts make a muscle alignment from your downloaded protein sequences

for file in sequence*
do
  	../muscle3.8.31_i86linux64 -in $file -out $file-align
done

#Construct 6 HMM protein models using hmm build

for file in *.fasta-align
do
  	../local/bin/hmmbuild $file.hmm $file
done

#Search all 4 translated RNAseqfiles for each of the 6 HMM models using hmmsearch

for file in *.hmm
do
  	../local/bin/hmmsearch --tblout ResultsHMM.csv $file [CO]*
done

