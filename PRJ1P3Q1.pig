Titanic_Records = LOAD 'TitanicData.txt' USING PigStorage(',') AS (ID:long, Survived:int, PsgClass:int, Name:chararray, Sex:chararray, Age:int, SibLp:chararray, Parch:chararray, Ticket:long, Fare:float, Cabin:chararray, Deprture:chararray) ;

Titanic_Filtered = FOREACH Titanic_Records GENERATE PsgClass, Fare ;

Titanic_Grouped  = GROUP Titanic_Filtered BY PsgClass ;
Average_Fare = FOREACH Titanic_Grouped GENERATE group, AVG(Titanic_Filtered.Fare) ;
DUMP Average_Fare ;

