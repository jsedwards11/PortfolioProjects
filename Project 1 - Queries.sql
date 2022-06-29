-- Covid Deaths table

-- Total cases vs total deaths by country

select location, max(total_cases) as total_cases, max(total_deaths) as total_deaths, concat(max(total_deaths)/max(total_cases)*100,'%') as death_percentage
from coviddeaths c 
where total_cases is not null and total_deaths is not null and continent is not null
group by location
order by 4 desc
;

-- Total cases vs total deaths in US

select location, max(total_cases) as total_cases, max(total_deaths) as total_deaths, concat(max(total_deaths)/max(total_cases)*100,'%') as death_percentage
from coviddeaths c 
where total_cases is not null and total_deaths is not null and continent is not null and location = 'United States'
group by location
order by 4 desc
;

-- Countries with top 5 highest death rates all time

select location, max(total_cases) as total_cases, max(total_deaths) as total_deaths, concat(max(total_deaths)/max(total_cases)*100,'%') as death_percentage
from coviddeaths c 
where total_cases is not null and total_deaths is not null and continent is not null
group by location
order by 4 desc
limit 5
;

-- Find date range of data for next query

select min(date), max(date)
from coviddeaths c 

-- Countries with top 5 highest death rates by year

(select case when date between '2020-01-01' and '2020-12-31' then '2020' when date between '2021-01-01' and '2021-12-31' then '2021' end as year, location, max(total_cases) as total_cases, max(total_deaths) as total_deaths, concat(max(total_deaths)/max(total_cases)*100,'%') as death_percentage
from coviddeaths c 
where total_cases is not null and total_deaths is not null and continent is not null and date between '2020-01-01' and '2020-12-31'
group by location, year
order by 5 desc
limit 5)
union all
(select case when date between '2021-01-01' and '2021-12-31' then '2021' end as year, location, max(total_cases) as total_cases, max(total_deaths) as total_deaths, concat(max(total_deaths)/max(total_cases)*100,'%') as death_percentage
from coviddeaths c 
where total_cases is not null and total_deaths is not null and continent is not null and date between '2021-01-01' and '2021-12-31'
group by location, year
order by 5 desc
limit 5)
;

-- Highest case rate vs population in the World

with CP as (
	select location, total_cases, population, date, (total_cases/population)*100  as CasePercentage
	from coviddeaths c
	where total_cases is not null and population is not null)
select *
from CP
where CasePercentage in (
	select max(CasePercentage)
	from CP)
;

-- Highest case rate vs population in the US

with CP as (
	select location, total_cases, population, date, (total_cases/population)*100  as CasePercentage
	from coviddeaths c
	where total_cases is not null and population is not null and location = 'United States')
select *
from CP
where CasePercentage in (
	select max(CasePercentage)
	from CP)
;

-- Highest death rate vs population in the World

with DP as (
	select location, total_deaths, population, date, (total_deaths/population)*100  as DeathPercentage
	from coviddeaths c
	where total_deaths is not null and population is not null)
select *
from DP
where deathpercentage in (
	select max(DeathPercentage)
	from DP)
;

-- Highest death rate vs population in US

with DP as (
	select location, total_deaths, population, date, (total_deaths/population)*100  as DeathPercentage
	from coviddeaths c
	where total_deaths is not null and population is not null and location = 'United States')
select *
from DP
where deathpercentage in (
	select max(DeathPercentage)
	from DP)
;

-- Highest death vs case rate in the World 

with DCP as (
	select location, total_deaths, total_cases, date, (total_deaths/total_cases)*100  as DeathCasePercentage
	from coviddeaths c
	where total_deaths is not null and total_cases is not null)
select *
from DCP
where DeathCasePercentage in (
	select max(DeathCasePercentage)
	from DCP)
;

-- Highest death vs case rate in the US

with DCP as (
	select location, total_deaths, total_cases, date, (total_deaths/total_cases)*100  as DeathCasePercentage
	from coviddeaths c
	where total_deaths is not null and total_cases is not null and location = 'United States')
select *
from DCP
where DeathCasePercentage in (
	select max(DeathCasePercentage)
	from DCP)
;

-- Countries with highest infection rates compared to populations

select location, population, max(total_cases) as HighestInfection, max((total_cases/population))*100 as PercentPopulationInfected
from coviddeaths c
where total_cases is not null and population is not null
group by location, population 
order by 4 desc
;

-- Days with highest infection rates in the world

select location, population, date, max(total_cases) as HighestInfection, max((total_cases/population))*100 as PercentPopulationInfected
from coviddeaths c
where total_cases is not null and population is not null and continent is not null
group by location, population, date
order by 4 desc
;

-- Top 5 days with highest infection rates in the US

select location, population, date, max(total_cases) as HighestInfection, max((total_cases/population))*100 as PercentPopulationInfected
from coviddeaths c
where total_cases is not null and population is not null and continent is not null and location = 'United States'
group by location, population, date
order by 4 desc
limit 5
;

-- Countries with highest death count

select location, sum(new_deaths) as total_deaths
from coviddeaths c 
where continent is not null and new_deaths is not null
group by location
order by 2 desc
;

-- Continents with highest death count

select continent, sum(new_deaths) as total_deaths
from coviddeaths c 
where continent is not null and new_deaths is not null
group by continent
order by 2 desc
;

-- Do same as above queries, but by continent for tableau visualization

-- Covid Vaccinations table 

select *
from covidvaccinations c 