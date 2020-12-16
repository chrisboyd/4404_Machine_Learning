import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from pandas.plotting import scatter_matrix
df = pd.read_csv("../Data/Adult/adult.csv",1,",")
data = [df]
print (df.head())
print ('hello')
