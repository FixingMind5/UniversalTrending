import argparse
import logging
import pandas as pd
import hashlib
import nltk
import numpy as np
import csv
import pdb

from nltk.corpus import stopwords
from urllib.parse import urlparse

stopwords = set(stopwords.words('spanish'))
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

def main(filename):
    logger.info('Starting the cleaning process')

    df = pd.read_csv(filename)
    for h in df.head():
        if h != 'text':
            df.drop(h, axis=1, inplace=True)

    df.to_csv('clean_{}'.format(filename))
    """return df"""


if __name__ == '__main__':

    parser = argparse.ArgumentParser()

    parser.add_argument('filename',
                        help='the path of the dirty data',
                        type=str)

    args = parser.parse_args()
    df = main(args.filename)
