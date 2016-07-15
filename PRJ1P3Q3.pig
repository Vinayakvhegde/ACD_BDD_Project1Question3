Titanic_Records = LOAD 'TitanicData.txt' USING PigStorage(',') AS (ID:long, Survived:int, PsgClass:int, Name:chararray, Sex:chararray, Age:int, SibLp:chararray, Parch:chararray, Ticket:long, Fare:float, Cabin:chararray, Departure:chararray) ;

Titanic_Selected = FOREACH Titanic_Records GENERATE PsgClass, Survived,Sex ;
Titanic_Filtered = FILTER Titanic_Selected BY (Survived == 1) ;

Titanic_Grouped  = GROUP Titanic_Filtered BY (PsgClass, Sex );
List_Survived = FOREACH Titanic_Grouped GENERATE group, COUNT(Titanic_Filtered) ;

DUMP List_Survived ;

