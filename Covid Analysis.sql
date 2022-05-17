-- Maximum total deaths
SELECT location, MAX(CAST(total_deaths AS integer)) AS total_deaths
FROM `project-348014.Project.CovidDeaths` 
 WHERE continent IS NOT NULL
 GROUP BY location
 ORDER BY total_deaths DESC;
 
-- Highet infected total cases 
 SELECT location, population, MAX(total_cases) AS highest_total_cases
FROM `project-348014.Project.CovidDeaths`
GROUP BY location,population ;


-- Max death percentage per country
SELECT location, population, MAX((total_deaths/total_cases)*100) AS highest_death_percentage
FROM `project-348014.Project.CovidDeaths`
GROUP BY location, population
ORDER BY highest_death_percentage DESC ;


-- Death percentage per population
SELECT location, date, ((total_deaths/total_cases)/population) * 100 AS total_deaths_per_population
FROM `project-348014.Project.CovidDeaths`;


-- Max total deaths per continents
SELECT continent, MAX(CAST(total_deaths AS integer)) AS total_deaths
FROM `project-348014.Project.CovidDeaths` 
 WHERE continent IS NOT NULL
 GROUP BY continent
 ORDER BY total_deaths DESC;

--Looking at total population vs vaccinations
SELECT dea.population, dea.continent, dea.location, dea.date, vac.new_vaccinations
FROM project-348014.Project.CovidDeaths AS dea
JOIN project-348014.Project.CovidVaccinations AS vac
ON dea.location = vac.location 
AND dea.date = vac.date
WHERE dea.continent IS NOT NULL AND vac.new_vaccinations IS NOT NULL
ORDER BY 1,2,3;