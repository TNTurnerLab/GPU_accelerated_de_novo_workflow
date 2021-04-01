# GPU accelerated de novo workflow

Please naviagte to the various folders to find code for the different parts of the project.

## denovo_workflow

The de novo workflow folder has the scripts required to run the de novo calling workflow.

## NA12878_comparison

This folder holds variuos scripts that were used to run the comparison of the various NA12878 samples.  This also holds the general code for how Parabricks, GLnexus, and preprocessing steps were run before running it in the de novo workflow

## Karyotyper

This folder holds a Snakemake workflow that creates a karyotype for a sample.

## Mutation Profile Analysis

While not shown in this Github repo, this analysis was run using deconstructSigs from Parabricks.  The version in the Parabricks software program is very similar to the original found [here.](https://github.com/raerose01/deconstructSigs)
