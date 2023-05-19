BEGIN{
    PHRED_CONST = -10 / log(10)
    acgt[0] = "A"
    acgt[1] = "C"
    acgt[2] = "G"
    acgt[3] = "T"
    print "##fileformat=VCFv4.2"
    print "##FORMAT=<ID=GT,Number=1,Type=String,Description=\"Genotype\">"
    print "##FORMAT=<ID=PL,Number=G,Type=Integer,Description=\"Normalized, Phred-scaled likelihoods for genotypes as defined in the VCF specification\">"
}
function toPhred(x)
{
    if (x == 1)
        return 0
    else if (x < 1e-6)
        return 60
    else
        return  int(PHRED_CONST * log(x) + 0.5)
}
function gtpl(p1,p2,p3     ,max, imax, gt)
{
    max=p1
    gt = "0/0"
    if (p2 > max) {
        max = p2
        gt = "0/1"
    }
    if (p3 > max) {
        max = p3
        gt = "1/1"
    }
    if (max < 0.8)
        gt = "./."
    i
    imax = 1 / max
    return gt ":" toPhred(p1 * imax) "," toPhred(p2 * imax) "," toPhred(p3 * imax)
}

(NR==1){
    s = "#CHROM\tPOS\tID\tREF\tALT\tQUAL\tFILTER\tINFO\tFORMAT"
    for (i = 4; i <= NF; i+=3)
        s = s "\t" $i
    print s
}
(NR>1){
    s = substr($1,1,index($1,"_")-1) "\t" substr($1,index($1,"_")+1) "\t.\t" acgt[$2] "\t" acgt[$3] "\t.\tPASS\t.\tGT:PL"
    for (i = 4; i <= NF; i+=3)
        s = s "\t" gtpl($i, $(i+1), $(i+2))
    print s
}