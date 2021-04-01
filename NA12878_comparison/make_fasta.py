#Jeffrey Ng
#Turner Lab, Washington University in St. Louis

names=["2018_2", "2018_1", "2020","2013","2012","Reference"]


holdme={}
for thing in names:
    holdme[thing]=''
with open('combined_NA12878_test_downsample_final_re_ref.fa','w') as out:
    with open('combined_NA12878_IUPAC_downsample_test_re_ref.vcf') as input:
        for line in input:
            if  not line.startswith('#'):
                data=line.strip().split('\t')
                #print(data[-1])
                ref=data[-1]
                #print(ref)
                holdme['Reference']+=ref
                ref=data[3]
                alt=data[4]
                x=0
                i=9
                while i < (len(data)-3):
                    holdme[names[x]]+=data[i]
                    i+=1
                    x+=1


    
    for x,y in holdme.items():
        out.write('>'+x+'\n')
        out.write(y+'\n')
