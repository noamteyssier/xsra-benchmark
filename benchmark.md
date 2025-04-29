| Command | Mean [s] | Min [s] | Max [s] | Relative |
|:---|---:|---:|---:|---:|
| `xsra-st-stdout-uncompressed` | 27.239 ± 0.352 | 26.990 | 27.488 | 7.22 ± 0.10 |
| `xsra-st-stdout-gzip` | 70.132 ± 1.167 | 69.307 | 70.957 | 18.60 ± 0.32 |
| `xsra-st-stdout-bgzip` | 70.332 ± 0.260 | 70.148 | 70.516 | 18.65 ± 0.11 |
| `xsra-st-stdout-zstd` | 30.064 ± 0.024 | 30.047 | 30.081 | 7.97 ± 0.04 |
| `xsra-mt-stdout-uncompressed` | 3.771 ± 0.017 | 3.759 | 3.782 | 1.00 |
| `xsra-mt-stdout-gzip` | 12.253 ± 0.020 | 12.239 | 12.267 | 3.25 ± 0.02 |
| `xsra-mt-stdout-bgzip` | 12.271 ± 0.074 | 12.218 | 12.323 | 3.25 ± 0.02 |
| `xsra-mt-stdout-zstd` | 8.213 ± 0.050 | 8.178 | 8.248 | 2.18 ± 0.02 |
| `xsra-st-split-uncompressed` | 28.407 ± 0.019 | 28.394 | 28.421 | 7.53 ± 0.03 |
| `xsra-st-recode-bq` | 25.157 ± 0.189 | 25.023 | 25.291 | 6.67 ± 0.06 |
| `xsra-st-recode-vbq` | 43.421 ± 0.146 | 43.318 | 43.524 | 11.52 ± 0.06 |
| `xsra-mt-split-uncompressed` | 5.762 ± 1.074 | 5.002 | 6.522 | 1.53 ± 0.28 |
| `xsra-mt-split-gzip` | 21.790 ± 0.282 | 21.590 | 21.989 | 5.78 ± 0.08 |
| `xsra-mt-split-bgzip` | 21.518 ± 0.001 | 21.517 | 21.518 | 5.71 ± 0.03 |
| `xsra-mt-split-zstd` | 11.604 ± 0.037 | 11.577 | 11.630 | 3.08 ± 0.02 |
| `xsra-mt-recode-bq` | 3.776 ± 0.006 | 3.772 | 3.780 | 1.00 ± 0.00 |
| `xsra-mt-recode-vbq` | 9.036 ± 0.017 | 9.025 | 9.048 | 2.40 ± 0.01 |
| `fasterq-st-stdout-uncompressed` | 48.706 ± 3.888 | 45.957 | 51.456 | 12.92 ± 1.03 |
| `fasterq-mt-stdout-uncompressed` | 20.401 ± 0.600 | 19.976 | 20.825 | 5.41 ± 0.16 |
| `fasterq-st-split-uncompressed` | 49.044 ± 6.675 | 44.324 | 53.764 | 13.01 ± 1.77 |
| `fasterq-mt-split-uncompressed` | 32.982 ± 1.325 | 32.045 | 33.919 | 8.75 ± 0.35 |
| `fastq-st-stdout-uncompressed` | 81.606 ± 0.549 | 81.218 | 81.994 | 21.64 ± 0.17 |
| `fastq-st-stdout-gzip` | 792.357 ± 11.794 | 784.018 | 800.697 | 210.14 ± 3.26 |
| `fastq-st-split-uncompressed` | 97.946 ± 0.461 | 97.620 | 98.272 | 25.98 ± 0.17 |
| `fastq-st-split-gzip` | 874.614 ± 13.381 | 865.152 | 884.076 | 231.95 ± 3.69 |
