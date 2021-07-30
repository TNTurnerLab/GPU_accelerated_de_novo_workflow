# GPU accelerated *de novo* workflow

Led by Jeffrey Ng of the Turner Lab at Washington University.
Please navigate to the various folders to find code for the different parts of the project.

## denovo_workflow

The de novo workflow folder has the scripts required to run the *de novo* calling workflow.

## NA12878_comparison

This folder holds various scripts that were used to run the comparison of the various NA12878 samples.  This also holds the general code for how Parabricks, GLnexus, and preprocessing steps were run before running it in the *de novo* workflow

## Karyotyper

This folder holds a Snakemake workflow that creates a karyotype for a sample.

## Unfazed

This folder holds the codes for running unfazed on de novo calls to get the parent-of-origin chromosome for the de novo variants.

## Viral Analysis

This folder holds the codes for estimating EBV copy number.

## Mutation Profile Analysis

While not shown in this Github repo, this analysis was run using deconstructSigs from Parabricks.  The version in the Parabricks software program is very similar to the original found [here.](https://github.com/raerose01/deconstructSigs)

## Data we have analyzed for 602 trios from the 1000 Genomes Project

Link can be found [here](https://app.globus.org/file-manager?origin_id=3eff453a-88f4-11eb-954f-752ba7b88ebe&origin_path=%2F)

UCSC Genome Browser track for 1000 Genomes Project DNV calls link:

```
https://data.cyverse.org/dav-anon/iplant/home/turnerlabwashu/Turner_Lab_Track_Hubs/Ng_et_al_1000G_DNV_Paper/hub.txt
```
