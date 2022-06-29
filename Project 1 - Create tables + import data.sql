drop table if exists CovidVaccinations
;

create table CovidVaccinations (
iso_code	varchar(100),
continent	varchar(100),
location	varchar(100),
date		date
)
;

copy CovidVaccinations(iso_code, continent, location, date)
from '/Users/jonedwards11/Public/CovidVaccinations.csv'
delimiter ','
csv header
;

select *
from covidvaccinations c 
;

drop table if exists CovidDeaths
;

create table CovidDeaths (
iso_code	varchar(100),
continent	varchar(100),
location	varchar(100),
date	date,
population	float,
total_cases	float,
new_cases	float,
new_cases_smoothed	float,
total_deaths	float,
new_deaths	float,
new_deaths_smoothed float,
total_cases_per_million	float,
new_cases_per_million	float,
new_cases_smoothed_per_million	float,
total_deaths_per_million	float,
new_deaths_per_million	float,
new_deaths_smoothed_per_million	float,
reproduction_rate	float,
icu_patients	float,
icu_patients_per_million	float,
hosp_patients	float,
hosp_patients_per_million	float,
weekly_icu_admissions	float,
weekly_icu_admissions_per_million	float,
weekly_hosp_admissions	float,
weekly_hosp_admissions_per_million float
)
;

copy CovidDeaths(iso_code, continent, location, date, population, total_cases, new_cases, new_cases_smoothed, total_deaths, new_deaths, new_deaths_smoothed, total_cases_per_million, new_cases_per_million, new_cases_smoothed_per_million, total_deaths_per_million, new_deaths_per_million, new_deaths_smoothed_per_million, reproduction_rate, icu_patients, icu_patients_per_million, hosp_patients, hosp_patients_per_million, weekly_icu_admissions, weekly_icu_admissions_per_million, weekly_hosp_admissions, weekly_hosp_admissions_per_million)
from '/Users/jonedwards11/Public/CovidDeaths.csv'
delimiter ','
csv header
;

select *
from  coviddeaths c 
;