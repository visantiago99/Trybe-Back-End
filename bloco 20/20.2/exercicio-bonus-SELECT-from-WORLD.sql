-- Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
SELECT name
  FROM world
 WHERE population > 200000000
-- Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, (gdp/population) FROM world
WHERE population >= 200000000
-- Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, (population/1000000) FROM world
WHERE continent = 'South America'
-- Show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name = 'France' OR name = 'Germany' OR name = 'Italy'
-- Show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name LIKE '%United%'
-- Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
-- Show the countries that are big by area or big by population. Show name, population and area.
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000
-- Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
-- For South America show population in millions and GDP in billions both to 2 decimal places.
-- Divide by 1000000 (6 zeros) for millions. Divide by 1000000000 (9 zeros) for billions.
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
WHERE continent = 'South America'
-- Greece has capital Athens.
-- Each of the strings 'Greece', and 'Athens' has 6 characters.
-- Show the name and capital where the name and the capital have the same number of characters.
SELECT name, capital FROM world
 WHERE LEN(name) = LEN(CAPITAL)
--  The capital of Sweden is Stockholm. Both words start with the letter 'S'.
-- Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operator.
SELECT name, capital FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital