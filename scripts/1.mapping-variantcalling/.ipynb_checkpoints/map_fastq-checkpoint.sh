#!/bin/bash

sample=$1
fastq1=$2
fastq2=$3

temp=$work/processed_data/1.mapping-variantcalling/temp
bams=$work/processed_data/1.mapping-variantcalling/bams

mkdir -p $temp
mkdir -p $bams

log=$bams/$sample-`date +%F-%T`.log

RG="@RG\tID:${sample}\tSM:${sample}\tPL:ILLUMINA\tLB:LIB"

( $bwa mem -M -R $RG -t $ncpu $refs.fa $fastq1 $fastq2 \
  | $samtools view -h -b -o $temp/${sample}_align.bam - ) 2>> $log

$samtools fixmate -@ $ncpu -m $temp/${sample}_align.bam $temp/${sample}_fixm.bam &>> $log

$samtools sort -@ $ncpu $temp/${sample}_fixm.bam -o $temp/${sample}_sort.bam &>> $log

$samtools index $temp/${sample}_sort.bam &>> $log

$gatk3 -T RealignerTargetCreator \
  -R $refs.fa -I $temp/${sample}_sort.bam -o $temp/${sample}.intervals  \
  -nt $ncpu &>> $log
  
$gatk3 -T IndelRealigner \
  -R $refs.fa -I $temp/${sample}_sort.bam -o $temp/${sample}_realign.bam \
  -targetIntervals $temp/${sample}.intervals &>> $log

$samtools markdup -@ $ncpu $temp/${sample}_realign.bam $bams/${sample}_markdup.bam
$samtools index $bams/${sample}_markdup.bam

rm $temp/${sample}*
