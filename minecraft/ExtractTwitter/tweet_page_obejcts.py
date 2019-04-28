import bs4
from common import config
import requests

class TweetComentary:
    def __init__(self, comentary_uid, url):
        self._config = config()['tweet_sites'][comentary_uid]
        self._queries = self._config['queries']
        self._html = None
        self._url = url

        self._visit(self._url)

    def _visit(self, url):
        response = requests.get(url)
        response.raise_for_status()
        self._html = bs4.BeautifulSoup(response.text, 'html.parser')

    def _select(self, query_string):
        return self._html.select(query_string)

    @property
    def publication_links(self):
        comentary_list = []

        """import pdb; pdb.set_trace()"""
        for comentary in self._select(self._queries['comentaries']):
            if comentary:
                comentary_list.append(comentary)


        return set(comentary for comentary in comentary_list)
