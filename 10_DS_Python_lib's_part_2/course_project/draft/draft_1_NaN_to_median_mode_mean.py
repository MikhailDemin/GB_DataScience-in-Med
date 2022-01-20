import pandas as pd
import numpy as np
import pickle
import random
from pathlib import Path

from sklearn.ensemble import RandomForestRegressor
from sklearn.preprocessing import StandardScaler, MinMaxScaler
from sklearn.model_selection import train_test_split, ShuffleSplit, cross_val_score, learning_curve
from sklearn.model_selection import StratifiedKFold, GridSearchCV, RandomizedSearchCV
from sklearn.metrics import classification_report, f1_score, precision_score, recall_score, r2_score

from sklearn.tree import DecisionTreeClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.neighbors import KNeighborsClassifier

from scipy.stats import shapiro
from scipy.stats import probplot
from scipy.stats import mannwhitneyu
from scipy.stats import chi2_contingency

import xgboost as xgb
import lightgbm as lgbm
import catboost as catb

import seaborn as sns
from matplotlib import pyplot as plt
#matplotlib inline

import warnings
warnings.filterwarnings('ignore')

DATA_ROOT = Path('./data_source/')
MODELS_PATH = Path('../models/')

# input
TRAIN_SET_PATH = DATA_ROOT / 'train.csv'
TEST_SET_PATH = DATA_ROOT / 'test.csv'
SAMPLE_SUBMIT_PATH = DATA_ROOT / 'sample_submission.csv'

# processing
PREPARED_TRAIN_SET_PATH = '../train_prep.csv'  # X_train, X_valid
PREPARED_TEST_SET_PATH = '../test_prep.csv'

SPLIT_TRAIN_SET_PATH = 'split_train.csv'
SPLIT_VALID_SET_PATH = 'split_valid.csv'

SCALER_FILE_PATH = MODELS_PATH / 'scaler.pkl'
MODEL_FILE_PATH = MODELS_PATH / 'model.pkl'

# output
PREDICTIONS_FILE_PATH = 'predictions.csv'

df_2 = pd.read_csv(TRAIN_SET_PATH)
# df_test_base = pd.read_csv(TEST_SET_PATH)

# df_2 = df_train_base.copy()
month_delinq = list(df_2['Months since last delinquent'])
print(month_delinq)

# count = df_2['Months since last delinquent'].isna().sum()
# print(count)
# print(type(count))
#
count = 0
# for i in month_delinq:
#     if type(i) == 'NaN' and count < 1361:
#         # nan = df_2['Months since last delinquent'].median()
#         print(type(i))
#         count += 1
while True:
    for i in month_delinq:
        if type(month_delinq[i]) is 'NaN' and count < 1361:
            # nan = df_2['Months since last delinquent'].median()
            print(type(month_delinq[i]))
            count += 1

#    elif nan
print(count)
print(df_2['Months since last delinquent'].isna().sum())
