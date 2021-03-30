holdme={}

#names=["H_IJ-NA12878_2018_MGI_80x_Coverage", "H_IJ-NA12878-NA12878_N12-TD_2018_MGI_38x_Coverage", "NA12878_1KG_2020_30x_Coverage", "NA12878_IPG_2013_45x_Coverage","NA12878_2012_GIAB_86x_Coverage","Reference"]#, "NA12891", "NA12892"]
names=["2018_2", "2018_1", "2020","2013","2012","Reference"]#, "NA12891", "NA12892"]

for thing in names:
    holdme[thing]=''

# with open('combined_NA12878_test_final.fa','w') as out:
#     with open('combined_NA12878_IUPAC_test.vcf') as input:
#         for line in input:
#             if  not line.startswith('#'):
#                 data=line.strip().split('\t')
#                 ref=data[3]
#                 alt=data[4]
#                 x=0
#                 i=9
#                 while i < (len(data)-2):
#                     holdme[names[x]]+=data[i]
#                     i+=1
#                     x+=1
#                 #holdme['Reference']+=data[-1]
#     for x,y in holdme.items():
#         out.write('>'+x+'\n')
#         out.write(y+'\n')
for thing in names:
    holdme[thing]=''
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


    #print(holdme['Reference'])
    for x,y in holdme.items():
        out.write('>'+x+'\n')
        out.write(y+'\n')
