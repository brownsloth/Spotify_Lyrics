# Create entertainment database in hive framework
CREATE DATABASE entertainment;

# Create table spotify lyrics in hive framework
CREATE EXTERNAL TABLE IF NOT EXISTS spotify_lyrics 
(
	artist string,
	song string,
	link string,
	text string)
	row format delimited fields terminated by ','
	stored as textfile 
	location 'hdfs://localhost:9000/spotify/';

# Display spotify lyrics dataset
SELECT *
FROM spotify_lyrics;

# Find song lyrics which artist is ABBA
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'ABBA';

# Distribution abba lyrics result on hadoop file system
INSERT OVERWRITE DIRECTORY 'hdfs://localhost:9000/spotify_lyrics/abba/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'ABBA'
AND text not like '%.html';

# Find song lyrics which artist is alabama
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Alabama';

# Distribution alabama lyrics result on hadoop file system
INSERT OVERWRITE DIRECTORY 'hdfs://localhost:9000/spotify_lyrics/alabama/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Alabama'
AND text not like '%.html';

# Find song lyrics which artist is donna summer
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Donna Summer';

# Distribution donna summer lyrics result on hadoop file system
INSERT OVERWRITE DIRECTORY 'hdfs://localhost:9000/spotify_lyrics/donna-summer/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Donna Summer'
AND text not like '%.html';

# Find song lyrics which artist is bob dylan
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Bob Dylan';

# Distribution bob dylan lyrics result on hadoop file system
INSERT OVERWRITE DIRECTORY 'hdfs://localhost:9000/spotify_lyrics/bob-dylan/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Bob Dylan'
AND text not like '%.html';

# Find song lyrics which artist is george strait
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Geogrge Strait';

# Distribution george strait lyrics result on hadoop file system
INSERT OVERWRITE DIRECTORY 'hdfs://localhost:9000/spotify_lyrics/george-strait/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Geogrge Strait'
AND text not like '%.html';

# Find song lyrics which artist is gordon lightfoot
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Gordon Lightfoot';

# Distribution gordon lightfoot lyrics result on hadoop file system
INSERT OVERWRITE DIRECTORY 'hdfs://localhost:9000/spotify_lyrics/gordon-lightfoot/'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
SELECT	text as lyrics
FROM spotify_lyrics
WHERE artist = 'Gordon Lightfoot'
AND text not like '%.html';