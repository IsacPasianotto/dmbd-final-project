# first argument is the input file
# second argument is the output file
import sys
import numpy as np
import pandas as pd

# open the input file and read it into a list of lines
with open(sys.argv[1], 'r') as f:
    lines = f.readlines()

# extract lines which starts with 'real' or 'user' or 'sys'
real = [line for line in lines if line.startswith('real')]
user = [line for line in lines if line.startswith('user')]
syst = [line for line in lines if line.startswith('sys')]

# extract the time from the lines
real = np.array([np.float64(line.split('\t')[1].split('m')[1].split('s')[0]) for line in real])
user = np.array([np.float64(line.split('\t')[1].split('m')[1].split('s')[0]) for line in user])
syst = np.array([np.float64(line.split('\t')[1].split('m')[1].split('s')[0]) for line in syst])

# cpu time is the sum of user and sys and round to 2 decimal places
cpu = np.round(user + syst, 3)

# Create a data frame with the data and write it to a csv file
data = np.array([real, cpu]).T
df = pd.DataFrame(data, columns=['real', 'cpu'])
df.to_csv(sys.argv[2], index=False)