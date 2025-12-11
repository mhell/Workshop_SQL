# SQL select query exercise
#
# World database layout:
# To use this database from a default MySQL install, type: use world;
#
# Table: City
# Columns: Id,Name,CountryCode,District,Population
#
# Table: Country
# Columns: Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, Capital
#
# Table: CountryLanguage
# Columns: CountryCode, Language, IsOfficial,Percentage
#

USE world;

#
# 1: Get a query to return "Hello World", 123
# (Hint: 1 row, 2 columns)
#
SELECT "hello world",123;
#
# 2: Get everything from the city table
# (Hint: Many many rows)
#
SELECT * FROM City;
#
# 3: Get everything on the cities whose district is "aceh"
# (Hint: 2 rows)
#
SELECT * FROM City WHERE district = 'aceh';
#
# 4: Get only the name of the cities where the countrycode is "bfa"
#
SELECT Name FROM City WHERE CountryCode = 'bfa';
#
# 5: Get both the name and district of the cities where the countrycode is "tto"
#
SELECT Name, District FROM City WHERE CountryCode = 'tto';
#
# 6: Get the name and district named as nm,dist from the cities where the countrycode is "arm"
#
SELECT Name AS nm, District AS dist FROM City WHERE CountryCode = 'arm';
#
# 7: Get the cities with a name that starts with "bor"
#
SELECT * FROM City WHERE Name LIKE 'bor%';
#
# 8: Get the cities with a name that contains the string "orto"
#
SELECT * FROM City WHERE Name LIKE '%orto%';
#
# 9: Get the cities that has a population below 1000
#
SELECT * FROM City Where Population < 1000;
#
# 10: Get the unique countrycodes from the cities that has a population below 1000
#
SELECT DISTINCT CountryCode FROM City WHERE Population < 1000;
#
# 11: Get the cities with the countrycode UKR that has more than 1000000 (one million) in population
#
SELECT * FROM City WHERE Countrycode = 'UKR' AND Population > 1000000;
#
# 12: Get the cities with a population of below 200 or above 9500000 (9.5 million)
#
SELECT * FROM City WHERE Population < 200 OR Population > 9500000;
#
# 13: Get the cities with the countrycodes TJK, MRT, AND, PNG, SJM
#
SELECT * FROM City WHERE Countrycode IN ('TJK', 'MRT', 'AND', 'PNG', 'SJM');
#
# 14: Get the cities with a population between 200 and 700 inclusive
#
SELECT * FROM City WHERE Population BETWEEN 200 AND 700;
#
# 15: Get the countries with a population between 8000 and 20000 inclusive
#
SELECT * FROM Country WHERE Population BETWEEN 8000 AND 20000;
#
# 16: Get the name of the countries with an independence year (indepyear) before year 0
#
SELECT Name FROM Country WHERE IndepYear < 0;
#
# 17: Get the countries that has no recorded independence year and a population above 1000000
#
SELECT * FROM Country WHERE IndepYear IS NULL AND Population > 1000000;
#
# 18: Get countries with a SurfaceArea below 10 and a defined LifeExpectancy
#
SELECT * FROM Country WHERE SurfaceArea < 10 AND LifeExpectancy IS NOT NULL;

