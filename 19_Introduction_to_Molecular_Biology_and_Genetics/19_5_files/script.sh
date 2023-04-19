#!/bin/bash
#########################Marina#########################
cd /content/sequence/marina
reads=SRR23625956.fastq
reference=sequence.fasta
annotation=sequence.gtf

fastqc $reads

bwa index $reference

bwa mem $reference $reads > marina.sam

samtools stats marina.sam | head -n 30

STAR --runMode genomeGenerate --genomeDir ./star_genome/ --genomeFastaFiles $reference

#then map

STAR --runMode alignReads --genomeDir ./star_genome/ --quantMode GeneCounts \
	--outFileNamePrefix M4_Marina --sjdbGTFfile $annotation \
	--readFilesIn $reads
#########################Mher#########################
cd /content/sequence/mher
reads=SRR5742252.fastq
reference=sequence.fasta
annotation=sequence.gtf

fastqc $reads

bwa index $reference

bwa mem $reference $reads > mher.sam

samtools stats mher.sam | head -n 30

STAR --runMode genomeGenerate --genomeDir ./star_genome/ --genomeFastaFiles $reference

#then map

STAR --runMode alignReads --genomeDir ./star_genome/ --quantMode GeneCounts \
	--outFileNamePrefix M4_Mher --sjdbGTFfile $annotation \
	--readFilesIn $reads
#########################Mikhail#########################
cd /content/sequence/mikhail
reads=SRR21375816.fastq
reference=sequence.fasta
annotation=sequence.gtf

fastqc $reads

bwa index $reference

bwa mem $reference $reads > mikhail.sam

samtools stats mikhail.sam | head -n 30

STAR --runMode genomeGenerate --genomeDir ./star_genome/ --genomeFastaFiles $reference

#then map

STAR --runMode alignReads --genomeDir ./star_genome/ --quantMode GeneCounts \
	--outFileNamePrefix M4_Mikhail --sjdbGTFfile $annotation \
	--readFilesIn $reads
#########################Marat#########################
cd /content/sequence/marat
reads=SRR23302705.fastq
reference=sequence.fasta
annotation=sequence.gtf

fastqc $reads

bwa index $reference

bwa mem $reference $reads > marat.sam

samtools stats marat.sam | head -n 30

STAR --runMode genomeGenerate --genomeDir ./star_genome/ --genomeFastaFiles $reference

#then map

STAR --runMode alignReads --genomeDir ./star_genome/ --quantMode GeneCounts \
	--outFileNamePrefix M4_Marat --sjdbGTFfile $annotation \
	--readFilesIn $reads