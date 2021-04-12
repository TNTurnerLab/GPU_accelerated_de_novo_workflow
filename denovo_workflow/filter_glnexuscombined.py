#Code by Jeffrey Ng, Turner Lab Washington University in St. Louis
import os
from argparse import ArgumentParser


def checkParents(parent,gq_filter,depth_filter):
    
    depth=int(parent[1])
    allref=int(parent[0].split(',')[1])
    gq=int(parent[2])

    if depth >= depth_filter and allref ==0 and gq>gq_filter:
  
        return(1)
    else:
        return(0)

def checkKid(kid,gq_filter,depth_filter):
    depth=int(kid[1])
    ref=int(kid[0].split(',')[1])
   
    gq =int(kid[2])

    if depth>=depth_filter and gq > gq_filter:
        
        checkme=float(ref)/float(depth)
       
        if float(checkme) > .25:
       
            return(1)
        else:
            return(0)
    else:
        return(0)

def checkPos(checkme,first,second,third):
    if checkme==first:
        return(0)
    elif checkme==second:
        return(1)
    elif checkme==third:
        return(2)

parser = ArgumentParser(description='Grab info for filter')
parser.add_argument('file',help='File to run')
parser.add_argument('f',help='Father')
parser.add_argument('m',help='Mother')
parser.add_argument('c',help='Child')
parser.add_argument('first',help='P1 from combined')
parser.add_argument('second',help='P2 from combined')
parser.add_argument('third',help='P3 from combined')
parser.add_argument('gq_filter',help='GQ filter value',type=int)
parser.add_argument('depth_filter',help='Depth filter value',type=int)
args = parser.parse_args()
holdme=[]
header=[]
file=args.file
name=file.strip().split('.')[0]
fi=checkPos(args.f,args.first,args.second,args.third)
mi=checkPos(args.m,args.first,args.second,args.third)
ci=checkPos(args.c,args.first,args.second,args.third)


with open(file) as input:

    for line in input:

        if not line.startswith('#'):
            data=line.strip().split('\t')
            samples=data[9:]
            father=samples[fi].split(':')[1:4]
            mother=samples[mi].split(':')[1:4]
            kid=samples[ci].split(':')[1:4]
            m=0
            f=0
            #print(father,data)
            if len(father[0].split(','))==2 and len(mother[0].split(','))==2 and len(kid[0].split(','))==2:
                f=checkParents(father,int(args.gq_filter),int(args.depth_filter))
                m=checkParents(mother,int(args.gq_filter),int(args.depth_filter))
                k=checkKid(kid,int(args.gq_filter),int(args.depth_filter))
                #print(f,m)
            if f==1 and m==1 and k==1:
                holdme.append(line)
        else:
            header.append(line)
with open(name+'.glnexus.family.combined_intersection_filtered_gq_'+str(args.gq_filter)+'_depth_'+str(args.depth_filter)+'.vcf','w') as out:
    for thing in header:
        out.write(thing)
    for thing in holdme:
        out.write(thing)

