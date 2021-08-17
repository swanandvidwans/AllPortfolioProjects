select * 
from CovidDeaths$
order by 3,4;

--Comment out for now
--select * 
--from CovidVaccinations$
--order by 3,4;

--Lets select data that we are going to be using
select location, date, total_cases, new_cases, total_deaths, population
from CovidDeaths$
order by 1,2;

-- Looking at total cases vs total deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
where location like '%India%'
order by 1,2;

-- Looking at a total_cases vs population
select location, date, population, total_cases, (total_cases/population)*100 as CasesPerPopulation
from CovidDeaths$
where location like '%India%'
order by 1,2;

-- Country wise Looking at total cases vs total deaths
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
order by 1,2;

-- Country wise Looking at a total_cases vs population
select location, date, population, total_cases, (total_cases/population)*100 as CasesPerPopulation
from CovidDeaths$
order by 1,2;

-- Looking at countries with highest infection rate compared to population
select location, population, max(total_cases) as HighestInfectionCount, max((total_cases/population))*100 as CasesPerPopulation
from CovidDeaths$
group by location,population
order by CasesPerPopulation desc;

-- Showing countries with highest DeathCount per population
select location, max(cast(total_deaths as int)) as HighestDeathCount
from CovidDeaths$
where continent is not null
group by location
order by HighestDeathCount desc;

-- Lets break things down by continent
select continent, max(cast(total_deaths as int)) as HighestDeathCount
from CovidDeaths$
where continent is not null
group by continent
order by HighestDeathCount desc;

-- Global Numbers
select date, sum(total_cases) as TotalCases, sum(cast(new_deaths as int)) as TotalDeaths  --, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
where continent is not null
group by date 
order by 1,2;

-------------------Now lets deal with vaccinations table ---------------

----Looking at total population vs vaccination

select CovidDeaths$.continent, CovidDeaths$.location, CovidDeaths$.date, CovidDeaths$.population, CovidVaccinations$.new_vaccinations 
, sum(cast(CovidVaccinations$.new_vaccinations as int)) over (partition by CovidDeaths$.location order by CovidDeaths$.location, CovidDeaths$.date) as RollingPeopleVaccinated
from CovidDeaths$
join CovidVaccinations$
	on CovidDeaths$.location = CovidVaccinations$.location
	and CovidDeaths$.date = CovidVaccinations$.date
where CovidDeaths$.continent is not null
order by 2,3;




