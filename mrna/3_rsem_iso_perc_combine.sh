#!/bin/bash

cd /home1/GENE_proc/SONGLITING/mRNA/rsem



# isoform count
cat *isoforms.results | awk '{print $8}'|awk '{printf "%15s", $0} !(NR%229693) {printf "\n"}' | sed 's/[ ][ ]*/\t/g' |cut -f3-| awk '{for(i=1;i<=NF;i=i+1){a[NR,i]=$i}}END{for(j=1;j<=NF;j++){str=a[1,j];for(i=2;i<=NR;i++){str=str "\t" a[i,j]}print str}}' > isoform_perc.txt


cat samples.txt  isoform_perc.txt > isoform_PERC.txt

paste isoform_ensg.txt isoform_PERC.txt -- > isoform_perc_matrix.txt

rm isoform_perc.txt isoform_PERC.txt



## gene tpm
#cat *genes.results | awk '{print $6}'|awk '{printf "%15s", $0} !(NR%62487) {printf "\n"}' | sed 's/[ ][ ]*/\t/g' |cut -f3-| awk '{for(i=1;i<=NF;i=i+1){a[NR,i]=$i}}END{for(j=1;j<=NF;j++){str=a[1,j];for(i=2;i<=NR;i++){str=str "\t" a[i,j]}print str}}' > gene_tpm.txt
#
##ls  *genes*|tr "\n" "\t" > samples.txt
#
#cat samples.txt  gene_tpm.txt > gene_TPM.txt
#cut -f1 B0536.genes.results > gene_ensg.txt
#paste gene_ensg.txt gene_TPM.txt -- > gene_tpm_matrix.txt
#
#rm gene_tpm.txt gene_TPM.txt
#
## isoform tpm
#cat *isoforms.results | awk '{print $6}'|awk '{printf "%15s", $0} !(NR%229693) {printf "\n"}' | sed 's/[ ][ ]*/\t/g' |cut -f3-| awk '{for(i=1;i<=NF;i=i+1){a[NR,i]=$i}}END{for(j=1;j<=NF;j++){str=a[1,j];for(i=2;i<=NR;i++){str=str "\t" a[i,j]}print str}}' > isoform_tpm.txt
#
#
#cat samples.txt  isoform_tpm.txt > isoform_TPM.txt
#
#cut -f1 B0536.isoforms.results > isoform_ensg.txt
#paste isoform_ensg.txt isoform_TPM.txt -- > isoform_tpm_matrix.txt
#
#rm isoform_tpm.txt isoform_TPM.txt


