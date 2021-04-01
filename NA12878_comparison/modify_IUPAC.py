#Jeffrey Ng
#Turner Lab, Washington University in St. Louis

holdme={}


with open('combined_NA12878_IUPAC_downsample_pacbio_test_re_ref.vcf','w') as out:
    with open('combined_NA12878_genotype_downsample_pacbio_test_nt.vcf') as input:
        for line in input:
            if  not line.startswith('#'):
                data=line.strip().split('\t')
                ref=data[3]
                alt=data[4]

                i=9
                while i < (len(data)):
                    if data[i]== 'AA' :
                        data[i]='A'
                    elif data[i]=='CC':
                        data[i]='C'
                    elif data[i]=='TT':
                        data[i]='T'
                    elif data[i]=='GG':
                        data[i]='G'
                    elif data[i]=='AC' or data[i]== 'CA':
                        data[i]='M'
                    elif data[i]== 'AG'or data[i]=='GA' :
                        data[i]='R'
                    elif data[i]== 'AT'or data[i]== 'TA':
                        data[i]='W'
                    elif data[i]== 'CG'or data[i]== 'GC':
                        data[i]='S'
                    elif data[i]== 'CT'or data[i]== 'TC':
                        data[i]='Y'
                    elif data[i]== 'GT'or data[i]== 'TG':
                        data[i]='K'
                    i+=1


                hello=''
                for thing in data:
                    hello+=thing+'\t'
                hello=hello.rstrip()
                out.write(hello+'\n')
