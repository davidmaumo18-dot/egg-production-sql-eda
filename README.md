# Egg Production SQL EDA

## Overview
SQL-based data cleaning and exploratory analysis on a 1000-record environmental 
effects dataset, using MySQL. Companion project to the R-based analysis of the 
same domain, demonstrating cross-tool validation.

## Tools
MySQL, MySQL Workbench

## Process
- Created database and table schema matching source data
- Validated data: checked for missing values and duplicate records across all fields
- Computed descriptive statistics (temperature, production ranges)
- Grouped analysis: average egg production by temperature range and ammonia range

## Key Results

**Missing values:** 0 across all 8 fields  
**Duplicate IDs:** 0

**Temperature vs. Production:**
| Temp Range | Records | Avg Production |
|---|---|---|
| 27.5-28.5 | 189 | — |
| 28.5-29.5 | 211 | 2059.2 |
| 29.5-30.5 | 200 | 2041.9 |
| 30.5-31.5 | 205 | 2019.7 |
| 31.5-32.5 | 195 | 1989.1 |

**Ammonia vs. Production:**
| Ammonia Range | Records | Avg Production |
|---|---|---|
| 12.5-14 | 257 | 2044.2 |
| 14-15.5 | 235 | 2027.7 |
| 15.5-17 | 264 | 2009.1 |
| 17-18.5 | 244 | 2006.0 |

## Insight
Both temperature and ammonia show a consistent negative relationship with egg 
production — as either factor increases, average production declines. This 
corroborates findings from the parallel R-based correlation analysis, 
strengthening confidence in temperature and ammonia management as actionable 
levers for production optimization.

## Files
- `egg_production_cleaning_eda.sql` — full query script
- `egg_production_full.csv` — dataset (1000 records)

## Background
Companion SQL analysis to the R-based EDA, part of ongoing agtech/livestock 
data analytics portfolio work.
