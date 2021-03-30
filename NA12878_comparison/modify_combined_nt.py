holdme={}
reference=[]

holdme={}
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
                #     #print(data[i])
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
                    #     counter=0
                    #     if sample[0]=='.':
                    #         sample[0]=str(0)
                    #         counter=1
                    #     if sample[1]=='.':
                    #         sample[1]=str(0)
                    #         counter=1
                    #     if counter==1:
                    #         data[i]=sample[0]+'/'+sample[1]
                    #     else:
                    #
                    #
                    #
                    i+=1
                    #out.write(line)
                hello=''
                for thing in data:
                    hello+=thing+'\t'

                hello+=gt
                out.write(hello+'\n')
                #exit()
