
SRA := "/Users/noam.teyssier/data/sra/SRR27592687/SRR27592687.sra"
NUM_CORES := "12"
DISK_LIMIT := "100G"

check-install:
    @echo "Checking for required tools..."
    @which xsra > /dev/null || (echo "xsra is not installed. Please install it by running 'pip install xsra'." && exit 1)
    @which fasterq-dump > /dev/null || (echo "fasterq-dump is not installed. Please install it by running 'conda install -c bioconda sra-tools'." && exit 1)
    @which fastq-dump > /dev/null || (echo "fastq-dump is not installed. Please install it by running 'conda install -c bioconda sra-tools'." && exit 1)
    @echo "All required tools are installed."

clean:
    @echo "Cleaning up..."
    rm -rfv *.fastq *.fastq.gz output/ fasterq*/

benchmark:
    @echo "Benchmarking tools"
    hyperfine \
        -r 2 \
        --export-csv benchmark.csv \
        --export-markdown benchmark.md \
        -n "xsra-st-stdout-uncompressed" \
            "xsra dump {{SRA}} -T1 > /dev/null" \
        -n "xsra-st-stdout-gzip" \
            "xsra dump {{SRA}} -T1 -cg > /dev/null" \
        -n "xsra-st-stdout-bgzip" \
            "xsra dump {{SRA}} -T1 -cb > /dev/null" \
        -n "xsra-st-stdout-zstd" \
            "xsra dump {{SRA}} -T1 -cz > /dev/null" \
        -n "xsra-mt-stdout-uncompressed" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} > /dev/null" \
        -n "xsra-mt-stdout-gzip" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} -cg > /dev/null" \
        -n "xsra-mt-stdout-bgzip" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} -cb > /dev/null" \
        -n "xsra-mt-stdout-zstd" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} -cz > /dev/null" \
        -n "xsra-st-split-uncompressed" \
            "xsra dump {{SRA}} -T1 -s" \
        -n "xsra-st-recode-bq" \
            "xsra recode {{SRA}} -T1 -fb -I 1,2" \
        -n "xsra-st-recode-vbq" \
            "xsra recode {{SRA}} -T1 -fv -I 1,2" \
        -n "xsra-mt-split-uncompressed" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} -s" \
        -n "xsra-mt-split-gzip" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} -s -cg" \
        -n "xsra-mt-split-bgzip" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} -s -cb" \
        -n "xsra-mt-split-zstd" \
            "xsra dump {{SRA}} -T{{NUM_CORES}} -s -cz" \
        -n "xsra-mt-recode-bq" \
            "xsra recode {{SRA}} -T{{NUM_CORES}} -fb -I 1,2" \
        -n "xsra-mt-recode-vbq" \
            "xsra recode {{SRA}} -T{{NUM_CORES}} -fv -I 1,2" \
        -n "fasterq-st-stdout-uncompressed" \
            "fasterq-dump {{SRA}} -e1 --include-technical --stdout --split-spot --disk-limit {{DISK_LIMIT}} > /dev/null" \
        -n "fasterq-mt-stdout-uncompressed" \
            "fasterq-dump {{SRA}} -e{{NUM_CORES}} --include-technical --stdout --split-spot  --disk-limit {{DISK_LIMIT}}> /dev/null" \
        -n "fasterq-st-split-uncompressed" \
            "fasterq-dump {{SRA}} -e1 --include-technical --split-files --disk-limit {{DISK_LIMIT}}" \
        -n "fasterq-mt-split-uncompressed" \
            "fasterq-dump {{SRA}} -e{{NUM_CORES}} --include-technical --split-files --disk-limit {{DISK_LIMIT}}" \
        -n "fastq-st-stdout-uncompressed" \
            "fastq-dump {{SRA}} --split-spot --stdout > /dev/null" \
        -n "fastq-st-stdout-gzip" \
            "fastq-dump {{SRA}} --split-spot --stdout --gzip > /dev/null" \
        -n "fastq-st-split-uncompressed" \
            "fastq-dump {{SRA}} --split-files" \
        -n "fastq-st-split-gzip" \
            "fastq-dump {{SRA}} --split-files --gzip" ;
