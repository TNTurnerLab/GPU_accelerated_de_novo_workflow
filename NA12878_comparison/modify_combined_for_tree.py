holdme={}
with open('combined_NA12878_genotype_downsample_test.vcf','w') as out:
    with open('NA12878_samples_downsample.combined.vcf') as input:
        for line in input:
            if  not line.startswith('#'):
                data=line.strip().split('\t')
                i=9
                while i < (len(data)-2):
                    #print(data[i])
                    sample=data[i].split(':')[0].split('/')
                    holder=data[i].split(':')[0]
                    counter=0
                    if sample[0]=='.':
                        sample[0]=str(0)
                        counter=1
                    if sample[1]=='.':
                        sample[1]=str(0)
                        counter=1
                    if counter==1:
                        data[i]=sample[0]+'/'+sample[1]


                    i+=1
                #out.write(line)
                hello=''
                for thing in data:
                    hello+=thing+'\t'
                hello=hello.rstrip()
                out.write(hello+'\n')
                #exit()
        #        data=line.strip().split('\t')
                #print(data)
