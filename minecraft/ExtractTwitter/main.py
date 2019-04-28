import pandas as pd
import argparse
import csv
import datetime
import re
import logging
logging.basicConfig(level=logging.INFO)

"""Mis librerias"""
import tweet_page_obejcts as tweet
from common import config

"""Para parsear los errores"""
from requests.exceptions import HTTPError
from urllib3.exceptions import MaxRetryError

logger = logging.getLogger(__name__)
is_well_formed_link = re.compile(r'^https?://.+/.+$')
is_root_path = re.compile(r'^/.+$')

def _coments_scraper(comentary_site_uid):
    host = config()['tweet_sites'][comentary_site_uid]['url']

    logging.info('Beginning scrapper from {}'.format(host))
    get_tweet = tweet.TweetComentary(comentary_site_uid, host)

    comentaries = []

    for some_tweet in get_tweet.publication_links:
        logger.info('Start fetching the comentary')
        comentary = some_tweet

        if comentary:
            logger.info('comentary obtained')
            comentaries.append(comentary)
            if len(comentaries) == 41:
                break

    _save_comentaries(comentary_site_uid, comentaries)



"""def _fetch_comentary(news_site_uid, host, link):
    logger.info('_Start fetching the comentary of {}'.format(link))

    comentary = None
    try:
        comentary = tweet.TweetComentary(news_site_uid, )
    except(HTTPError, MaxRetryError) as e:
        logger.warning('Error while parsing the comentary', exc_info = False)

    import pdb; pdb.set_trace()
    return comentary"""


"""def _build_link(host, link):
    if is_well_formed_link.match(str(link)):
        return link
    elif is_root_path.match(str(link)):
        return '{}{}'.format(host, link)
    else:
        return '{host}/{uri}'.format(host=host, uri=link)"""


def _save_comentaries(comentary_uid, comentaries):
    now = datetime.datetime.now().strftime('%Y_%m_%d')
    out_file_name = "{comentary_uid}_{datetime}_comentary.csv".format(
                    comentary_uid=comentary_uid,
                    datetime=now
    )

    csv_headers = list(filter(lambda property: not property.startswith('_'), dir(comentaries[0])))

    with open(out_file_name, mode='w+') as f:
        writer = csv.writer(f)
        writer.writerow(csv_headers)

        for com in comentaries:
            row = [str(getattr(com, prop)) for prop in csv_headers]
            writer.writerow(row)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()

    comentary_choice = list(config()['tweet_sites'].keys())
    parser.add_argument('tweet_site',
                        help='The comentaries you want to obtain',
                        type=str,
                        choices=comentary_choice)

    args = parser.parse_args()

    _coments_scraper(args.tweet_site)
