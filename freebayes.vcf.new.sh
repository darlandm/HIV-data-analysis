#! /usr/bin/env bash
#BSUB -J vcf
#BSUB -o log/%J.out
#BSUB -e log/%J.err

set -o nounset -o pipefail -o errexit -x

source config2.sh
PROJECT="$HOME/projects/mutation-mapping"
bam="JS208.nodis.nochim.bam"
bam2="JS208.rmdup.bam"
bam3="JS208.MD.bam"

VCFPREFIX=JS208
FASTA="$PROJECT/results/hiv.ref/hg19-hiv.lines.fa"
STDIN="-"

freebayes -f $FASTA --min-alternate-fraction .01 -m 30 -q 30 -r HIV:1-9562 $bam >$VCFPREFIX.whole.HIV.m30q30.vcf
freebayes -f $FASTA --min-alternate-fraction .01 -m 30 -q 30 -r HIV:1-9562 $bam2 >$VCFPREFIX.rmdup.HIV.m30q30.vcf
freebayes -f $FASTA --min-alternate-fraction .01 -m 30 -q 30 -r HIV:1-9562 $bam3 > $VCFPREFIX.MD.HIV.m30q30.vcf



