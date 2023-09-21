# dmbd-final-project

Authors:\
&emsp;[**Pasianotto Isac**](https://github.com/IsacPasianotto/)\
&emsp;[**Rossi Davide**](https://github.com/DavideRossi1/)\
Date:\
&emsp;2023-09

This repository contains the code, the results and the produced report for the final project of the course "Data Management for Big Data" of the Master's Degree in Data Science and Scientific Computing at the University of Trieste.

All the considerations we made during the project are reported in the [report](./report.pdf).

## How to reproduce the results

### Requirements

The scripts were designed and tested with the Linux operating system.  We expect it to work the same on MacOS. A Windows version of the scripts has not been implemented

The following software is required to run the scripts:

- [PostgreSQL](https://www.postgresql.org/) (tested with version 14.9)
- [Python](https://www.python.org/) (tested with version 3.11.4)\
  With the following libraries:
    - [pandas](https://pandas.pydata.org/)
    - [numpy](https://numpy.org/)

### Steps

1. Clone the repository: `

```bash
git clone https://github.com/IsacPasianotto/dmbd-final-project
```

2. fill the file `credentials.sh` with the credentials to access the database
3. Generate the tables, create a database and fill it with the data by running the script `init.sh`:

```bash
sh init.sh
```

4. The actual analysis is performed by the script `benchmark-all.sh`, which will generate the results in the `results` folder:

```bash
sh benchmark-all.sh
```

5. The results can be aggregated into a single and more readable file by running the script `mergeall.py` which will generate the file `all.csv`

```bash
python3 mergeall.py
```

6. Once everything is done, we can clean up the database and the unnecessary files by running the script `clean.sh`:

```bash
sh clean.sh
```


**Note**: By default, every measurement is performed 75 times, in order to have a more statistically significant result. This can be changed by modifying the variable `niter` in the [`single-benchmark.sh`](./single-benchmark.sh) file.


