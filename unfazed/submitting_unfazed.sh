#!/bin/bash

DENOVOBED="$1"
DVVCF="$2"
PED="$3"
CHILD="$4"
DAD="$5"
MOM="$6"
REFERENCE="$7"

export LSF_DOCKER_VOLUMES="/relevant/for/your/analysis/:/relevant/for/your/analysis/"

bsub -R 'span[hosts=1] rusage[mem=100G]' -g groupname -n 1 -M 100G -q general -G compute-tychele -oo "$CHILD"_unfazed.oo -a "docker(tychelewustl/unfazed:v1.0.2)" sh unfazed.sh "$DENOVOBED" "$DVVCF" "$PED" "$CHILD" "$DAD" "$MOM" "$REFERENCE"
