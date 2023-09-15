-- Portfolio Porject
-- a. Datawise Likelihood of dying due to covid-Totalcases vs TotalDeaths in India
SELECT date, total_cases, total_deaths 
FROM "CovidDeaths"
WHERE LOCATION LIKE '%India%'

-- b. Total % of deaths out of entire population in India
SELECT MAX(total_deaths)/AVG(CAST (population AS integer))*100 
FROM "CovidDeaths"
WHERE LOCATION LIKE '%India%'

-- c. Verify b. by getting info separately
SELECT total_deaths, population FROM "CovidDeaths"
WHERE LOCATION LIKE '%India%'

-- d. Country with highest death as a % of population
SELECT LOCATION, (MAX(total_deaths)/AVG(CAST(population AS bigint))*100) AS Percentage 
FROM "CovidDeaths" GROUP BY LOCATION ORDER BY percentage DESC

-- e. Total % of Covid +ve cases in India
SELECT (MAX(total_cases)/AVG(CAST(population AS bigint))*100) AS PercentagePositive 
FROM "CovidDeaths" WHERE LOCATION LIKE '%India%'

-- f. Total % of Covid +ve cases in world
SELECT LOCATION, (MAX(total_cases)/AVG(CAST(population AS bigint))*100) AS PercentagePositive 
FROM "CovidDeaths" GROUP BY LOCATION ORDER BY percentagepositive DESC

-- g. Continentwise +ve Cases
SELECT LOCATION, MAX(total_cases) AS total_case 
FROM "CovidDeaths" WHERE continent IS NULL 
GROUP BY location ORDER BY total_case DESC

-- h. Continetwise covid Deaths
SELECT LOCATION, MAX(total_deaths) AS total_deaths 
FROM "CovidDeaths" WHERE continent IS NULL 
GROUP BY location ORDER BY total_deaths DESC

-- i. Daily newcases VS hospitalizations VS icu_patients in India
SELECT date, new_cases, hosp_patients, icu_patients
FROM "CovidDeaths" WHERE LOCATION LIKE '%India%'

-- j. Countrywise more than 65> age 
select avg("CovidDeaths".population),max("CovidVaccinations".people_fully_vaccinated),"CovidVaccinations".total_boosters 
from "CovidDeaths" inner join "CovidVaccinations" on "CovidDeaths".iso_code="CovidVaccinations".iso_code and "CovidDeaths".date="CovidVaccinations".date  
group by "CovidVaccinatios".location;


-- k. Countrywise total vaccinated people
select "CovidDeaths".location as country,max("CovidVaccinations".people_fully_vaccinated) as Fully_vaccinated 
from "CovidDeaths" join "CovidVaccinations" on "CovidDeaths".iso_code="CovidVaccinations".iso_code and "CovidDeaths".date="CovidVaccinations".date 
where "CovidDeaths".continent is not null group by country order by Fully_vaccinated desc;

