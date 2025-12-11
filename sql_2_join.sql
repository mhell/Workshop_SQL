# SQL Join exercise
#
USE world;
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
#
SELECT * FROM City WHERE Name LIKE 'ping%' ORDER BY Population ASC; 
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
#
SELECT * FROM City WHERE Name LIKE 'ran%' ORDER BY Population DESC; 
#
# 3: Count all cities
#
-- select * from city LIMIT 5000;
SELECT COUNT(Name) FROM City;
#
# 4: Get the average population of all cities
#
SELECT AVG(Population) FROM City; 
#
# 5: Get the biggest population found in any of the cities
#
SELECT MAX(Population) FROM City;
#
# 6: Get the smallest population found in any of the cities
#
SELECT MIN(Population) FROM City;
#
# 7: Sum the population of all cities with a population below 10000
#
SELECT SUM(Population) FROM City WHERE Population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
#
SELECT COUNT(*) FROM City WHERE CountryCode = 'MOZ' OR CountryCode = 'VNM';
SELECT COUNT(*) FROM City WHERE CountryCode IN ('MOZ', 'VNM');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
#
SELECT COUNT(*) FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;
#
# 10: Get average population of cities in MOZ and VNM
#
SELECT AVG(population) FROM City WHERE CountryCode IN ('MOZ', 'VNM');
#
# 11: Get the countrycodes with more than 200 cities
#
SELECT CountryCode FROM city GROUP BY CountryCode HAVING COUNT(*) > 200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
#
SELECT CountryCode FROM city GROUP BY CountryCode HAVING COUNT(*) > 200 ORDER BY COUNT(*) ASC;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
#
SELECT Language FROM City NATURAL JOIN CountryLanguage WHERE Population BETWEEN 400 AND 500; 
-- SELECT language FROM city JOIN countrylanguage ON city.CountryCode = countrylanguage.CountryCode WHERE population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
#
SELECT Name, Language FROM City NATURAL JOIN CountryLanguage WHERE Population BETWEEN 500 AND 600; 
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
#
-- SELECT DISTINCT City.Name FROM City INNER JOIN Country ON City.CountryCode = (SELECT CountryCode FROM City WHERE Population = 122199);
SELECT city.name 
FROM city 
JOIN city AS other_city ON city.countrycode = other_city.countrycode 
WHERE other_city.population = 122199;
-- SELECT name FROM city WHERE countrycode IN (SELECT countrycode FROM city WHERE population = 122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
#
-- SELECT DISTINCT City.Name FROM City INNER JOIN Country ON City.CountryCode = (SELECT CountryCode FROM City WHERE Population = 122199) WHERE City.Population <> 122199;
SELECT name FROM city WHERE countrycode IN (SELECT countrycode FROM city WHERE population = 122199) AND Population NOT IN (122199);
#
# 17: What are the city names in the country where Luanda is capital?
#
SELECT City.Name FROM City INNER JOIN Country ON City.CountryCode = Country.Code 
WHERE Capital = (SELECT Id FROM City WHERE Name = 'Luanda');
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT City.Name 
FROM Country JOIN City ON Country.Capital = City.Id 
WHERE Country.Region = (SELECT Region 
						FROM City INNER JOIN Country ON City.CountryCode = Country.Code 
                        WHERE City.Name = 'Yaren');
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
#
SELECT DISTINCT Language FROM CountryLanguage WHERE CountryCode IN (SELECT CountryCode FROM City WHERE Name = 'Riga');
#
# 20: Get the name of the most populous city
#
SELECT Name FROM City ORDER BY Population DESC LIMIT 1;
-- SELECT Name FROM City where Population=(SELECT MAX(Population) FROM city);

