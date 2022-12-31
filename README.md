# Spotify Lyrics
<img src="https://github.com/Bayunova28/Spotify_Lyrics/blob/master/cover.png" height="450" width="1100">

## Background 
<p align="justify">Audio streaming and media services provider founded on 23 April 2006 by Daniel Ek and Martin Lorentzon. It is one of the largest music streaming 
service providers, with over 456 million monthly active users, including 195 million paying subscribers, as of September 2022. Spotify is listed (through a Luxembourg 
City-domiciled holding company, Spotify Technology S.A.) on the New York Stock Exchange in the form of American depositary receipts. Spotify offers digital copyright 
restricted recorded music and podcasts, including more than 82 million songs, from record labels and media companies. As a freemium service, basic features are free with 
advertisements and limited control, while additional features, such as offline listening and commercial-free listening, are offered via paid subscriptions. Users can 
search for music based on artist, album, or genre, and can create, edit, and share playlists. Spotify is available in most of Europe, as well as Africa, the Americas, 
Asia and Oceania, with a total availability in 184 markets. The service is available on most devices including Windows, macOS, and Linux computers, iOS and Android 
smartphones and tablets, smart home devices such as the Amazon Echo and Google Nest lines of products and digital media players like Roku.</p>

## Requirement 
* <b>[Apache Hadoop](https://archive.apache.org/dist/hadoop/common/)</b>
* <b>[Apache Derby](https://db.apache.org/derby/derby_downloads.html)</b>
* <b>[Apache Hive](https://hive.apache.org/downloads.html)</b>

#### Mapper.py
```py
# import python library
import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    words = line.split()
    # increase counters
    for word in words:
        # write the results to STDOUT (standard output)
        # tab-delimited; the trivial word count is 1
        print('%s\t%s' % (word, 1))
```  
#### Reducer.py
```py
# import python library
from operator import itemgetter
import sys

# set parameter from words dataset
current_word = None
current_count = 0
word = None

# input comes from STDIN
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()

    # parse the input we got from mapper.py
    word, count = line.split('\t', 1)

    # convert count (currently a string) to int
    try:
        count = int(count)
    except ValueError:
        # count was not a number, so silently
        # ignore/discard this line
        continue

    # this IF-switch only works because Hadoop sorts map output
    # by key (here: word) before it is passed to the reducer
    if current_word == word:
        current_count += count
    else:
        if current_word:
            # write result to STDOUT
            print('%s\t%s' % (current_word, current_count))
        current_count = count
        current_word = word

# do not forget to output the last word if needed!
if current_word == word:
    print('%s\t%s' % (current_word, current_count))
```

#### Run mapper and reducer program  
```sh
EXEC=$hadoop jar c:\hadoop-2.8.0\share\hadoop\tools\lib\hadoop-streaming-*.jar -file "D:\mapper.py" -mapper "python D:\mapper.py" -file "D:\reducer.py" -reducer "python D:\reducer.py" -input spotify/samples.txt -output spotify/output/
echo "$EXEC"
```
#### Hadoop Web UI 
<img src="https://github.com/Bayunova28/Spotify_Lyrics/blob/master/hadoop-web-ui.jpg" height="550" width="1100">

## Acknowledgement
* <b>Data Source : [Spotify Million Song Dataset](https://www.kaggle.com/datasets/notshrirang/spotify-million-song-dataset)
* <b>Mapreduce Tutorial : [Michael G. Noll](https://www.michael-noll.com/tutorials/writing-an-hadoop-mapreduce-program-in-python/)
* <b>Hadoop Tutorial : [Edureka](https://www.youtube.com/watch?v=g7Qpnmi0Q-s)
* <b>Hive Tutorial : [Simplilearn](https://www.youtube.com/watch?v=rr17cbPGWGA)</b>
