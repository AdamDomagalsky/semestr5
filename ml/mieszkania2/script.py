#!/usr/bin/python
from sklearn import linear_model
import pandas as pd
import matplotlib.pyplot as plot
import seaborn as sns



df=pd.read_csv('./train/train.tsv', header=None, sep='\t')
df.columns=['price','new','rooms','floor','area','m2']

print df
