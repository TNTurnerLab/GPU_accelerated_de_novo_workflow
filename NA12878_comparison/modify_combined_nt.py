#Jeffrey Ng
#Turner Lab, Washington University in St. Louis

holdme={}
reference=[]


with open('combined_NA12878_genotype_downsample_pacbio_test_nt.vcf','w') as out:
    with open('combined_NA12878_genotype__downsample_pacbio_test.vcf') as input:
        for line in input:
            if  not line.startswith('#'):
                data=line.strip().split('\t')
                ref=data[3]
                alt=data[4]
                gt=''
                if len(ref)==1:
                    gt=ref+ref
                    reference.append(gt)
                elif  len(ref)!=1:
                    gt=ref[0]+ref[0]
                    reference.append(gt)
                i=9
                while i < (len(data)-2):

                    sample=data[i].split(':')[0].split('/')
                    holder=data[i].split(':')[0]
                    if holder=='0/0' and len(ref)==1:
                        data[i]=ref+ref
                    elif holder=='0/0' and len(ref)!=1:
                        data[i]=ref[0]+ref[0]
                    elif  holder=='0/1'and len(alt)==1 and len(ref)==1:
                        data[i]=ref+alt
                    elif holder=='0/1'and len(alt)!=1:
                        data[i]=ref+alt[0]
                    elif holder=='0/1' and len(ref)!=1 and len(alt)==1:
                        data[i]=ref[0]+alt
                    else:
                        print(line)

                    i+=1

                hello=''
                for thing in data:
                    hello+=thing+'\t'

                hello+=gt
                out.write(hello+'\n')
