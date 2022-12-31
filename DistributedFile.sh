# Generate java home and hadoop home
JAVA_HOME=$cd %java_home%
echo "$JAVA_HOME"

HADOOP_HOME=$cd %hadoop_home%
echo "$HADOOP_HOME"

WIN_UTILS=$winutils chmod -R 777 C:\hadoop-2.8.0
echo "$WIN_UTILS"

# Call datanode and namenode on hadoop
NODE=$cd sbin\start-dfs.cmd
echo "$NODE"

HADOOP_FORMAT=$hadoop namenode -format
echo "$HADOOP_FORMAT"

# Check hadoop directory file system
DIR_FILE=$hadoop fs -ls hdfs://localhost:9000/
echo "$DIR_FILE"

# Create directory project
DIR_PROJECT=$hadoop fs -mkdir hdfs://localhost:9000/spotify
echo "$DIR_PROJECT"

# Upload data from local to hadoop directory file system
DATA=$hadoop fs -copyFromLocal D:\spotify\spotify_millsongdata.csv hdfs://localhost:9000/spotify/spotify-lyrics.csv
echo "$DATA"

# Check data in hadoop directory file system
DIR_FILE=$hadoop fs -ls hdfs://localhost:9000/spotify/
echo "$DIR_FILE"

# Read lazada items dataset in hadoop file system
DIR_FILE=$hadoop fs -cat hdfs://localhost:9000/spotify/spotify-lyrics.csv
echo "$DIR_FILE"

# Rename hadoop file system of analysis abba lyrics result from hive system 
FILE_RENAME=$hadoop fs -mv hdfs://localhost:9000/spotify/abba/000000_0 hdfs://localhost:9000/spotify/abba/lyrics.txt
echo "$FILE_RENAME"

# Rename hadoop file system of analysis alabama lyrics result from hive system 
FILE_RENAME=$hadoop fs -mv hdfs://localhost:9000/spotify/alabama/000000_0 hdfs://localhost:9000/spotify/alabama/lyrics.txt
echo "$FILE_RENAME"

# Rename hadoop file system of analysis bob dylan lyrics result from hive system 
FILE_RENAME=$hadoop fs -mv hdfs://localhost:9000/spotify/bob-dylan/000000_0 hdfs://localhost:9000/spotify/bob-dylan/lyrics.txt
echo "$FILE_RENAME"

# Rename hadoop file system of analysis donna summer lyrics result from hive system 
FILE_RENAME=$hadoop fs -mv hdfs://localhost:9000/spotify/donna-summer/000000_0 hdfs://localhost:9000/spotify/donna-summer/lyrics.txt
echo "$FILE_RENAME"

# Generate Mapreduce on abba lyrics in hadoop system
MAP_RED=$hadoop jar c:\hadoop-2.8.0\share\hadoop\tools\lib\hadoop-streaming-*.jar -file "D:\mapper.py" -mapper "python D:\mapper.py" -file "D:\reducer.py" -reducer "python D:\reducer.py" -input hdfs://localhost:9000/spotify/abba/lyrics.txt -output hdfs://localhost:9000/spotify/abba/output/
echo "$MAP_RED"

# Generate Mapreduce on alabama lyrics in hadoop system
MAP_RED=$hadoop jar c:\hadoop-2.8.0\share\hadoop\tools\lib\hadoop-streaming-*.jar -file "D:\mapper.py" -mapper "python D:\mapper.py" -file "D:\reducer.py" -reducer "python D:\reducer.py" -input hdfs://localhost:9000/spotify/alabama/lyrics.txt -output hdfs://localhost:9000/spotify/alabama/output/
echo "$MAP_RED"

# Generate Mapreduce on bob dylan lyrics in hadoop system
MAP_RED=$hadoop jar c:\hadoop-2.8.0\share\hadoop\tools\lib\hadoop-streaming-*.jar -file "D:\mapper.py" -mapper "python D:\mapper.py" -file "D:\reducer.py" -reducer "python D:\reducer.py" -input hdfs://localhost:9000/spotify/bob-dylan/lyrics.txt -output hdfs://localhost:9000/spotify/bob-dylan/output/
echo "$MAP_RED"

# Generate Mapreduce on donna summer lyrics in hadoop system
MAP_RED=$hadoop jar c:\hadoop-2.8.0\share\hadoop\tools\lib\hadoop-streaming-*.jar -file "D:\mapper.py" -mapper "python D:\mapper.py" -file "D:\reducer.py" -reducer "python D:\reducer.py" -input hdfs://localhost:9000/spotify/donna-summer/lyrics.txt -output hdfs://localhost:9000/spotify/donna-summer/output/
echo "$MAP_RED"

# Generate Mapreduce on george strait lyrics in hadoop system
MAP_RED=$hadoop jar c:\hadoop-2.8.0\share\hadoop\tools\lib\hadoop-streaming-*.jar -file "D:\mapper.py" -mapper "python D:\mapper.py" -file "D:\reducer.py" -reducer "python D:\reducer.py" -input hdfs://localhost:9000/spotify/george-strait/lyrics.txt -output hdfs://localhost:9000/spotify/george-strait/output/
echo "$MAP_RED"

# Generate Mapreduce on gordon lightfoot lyrics in hadoop system
MAP_RED=$hadoop jar c:\hadoop-2.8.0\share\hadoop\tools\lib\hadoop-streaming-*.jar -file "D:\mapper.py" -mapper "python D:\mapper.py" -file "D:\reducer.py" -reducer "python D:\reducer.py" -input hdfs://localhost:9000/spotify/gordon-lightfoot/lyrics.txt -output hdfs://localhost:9000/spotify/gordon-lightfoot/output/
echo "$MAP_RED"

# Check mapreduce result on abba directory 
FILE_RESULT=$hadoop fs -cat hdfs://localhost:9000/spotify/abba/output/part-00000
echo "$FILE_RESULT"

# Check mapreduce result on alabama directory 
FILE_RESULT=$hadoop fs -cat hdfs://localhost:9000/spotify/alabama/output/part-00000
echo "$FILE_RESULT"

# Check mapreduce result on donna summer directory 
FILE_RESULT=$hadoop fs -cat hdfs://localhost:9000/spotify/donna-summer/output/part-00000
echo "$FILE_RESULT"

# Check mapreduce result on bob dylan directory 
FILE_RESULT=$hadoop fs -cat hdfs://localhost:9000/spotify/bob-dylan/output/part-00000
echo "$FILE_RESULT"

# Check mapreduce result on george strait directory 
FILE_RESULT=$hadoop fs -cat hdfs://localhost:9000/spotify/george-strait/output/part-00000
echo "$FILE_RESULT"

# Check mapreduce result on gordon lightfoot directory 
FILE_RESULT=$hadoop fs -cat hdfs://localhost:9000/spotify/gordon-lightfoot/output/part-00000
echo "$FILE_RESULT"

# Download abba mapreduce result in local computer 
OUT_FILE=$hadoop fs -copyToLocal hdfs://localhost:9000/spotify/abba/output/part-00000 D:\spotify\abba-lyrics.txt
echo "$OUT_FILE"

# Download alabama mapreduce result in local computer 
OUT_FILE=$hadoop fs -copyToLocal hdfs://localhost:9000/spotify/alabama/output/part-00000 D:\spotify\alabama-lyrics.txt
echo "$OUT_FILE"

# Download donna summer mapreduce result in local computer 
OUT_FILE=$hadoop fs -copyToLocal hdfs://localhost:9000/spotify/donna-summer/output/part-00000 D:\spotify\donna-summer-lyrics.txt
echo "$OUT_FILE"

# Download bob dylan mapreduce result in local computer 
OUT_FILE=$hadoop fs -copyToLocal hdfs://localhost:9000/spotify/bob-dylan/output/part-00000 D:\spotify\bob-dylan-lyrics.txt
echo "$OUT_FILE"

# Download george strait mapreduce result in local computer 
OUT_FILE=$hadoop fs -copyToLocal hdfs://localhost:9000/spotify/george-strait/output/part-00000 D:\spotify\george-strait-lyrics.txt
echo "$OUT_FILE"

# Download gordon lightfoot mapreduce result in local computer 
OUT_FILE=$hadoop fs -copyToLocal hdfs://localhost:9000/spotify/gordon-lightfoot/output/part-00000 D:\spotify\gordon-lightfoot-lyrics.txt
echo "$OUT_FILE"