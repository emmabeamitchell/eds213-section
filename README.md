# Creating Tables And Queries to Answer Global Crop Questions 
### Author: Emma Bea Mitchell
### Created for UCSB Bren School's EDS 213: Databases and Data Management Class

![](https://images.unsplash.com/photo-1501255184224-b8e069bca278?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHdoZWF0JTIwZmllbGR8ZW58MHx8MHx8fDA%3D)
## Purpose of the Repository
The purpose of this repository is to practice SQL database creation and queries using multiple datasets. In this repository there is an R script that contains basic cleaning of the datasets, as well as SQL script to create tables from those cleaned datasets and to create a query to answer our question. The question I came up with to be answered with this data is: What countries (excluding the US) have the largest yield of wheat, and how does the precipitation and temperature at the time of planting vary between the top 5 countries? 

## How to Reproduce the Code in This Repository
The code should be run in the order as follows:
- data_cleaning.qmd
- sections.sql
- query_and_viz.qmd

## What is housed in this repository?

``` r
eds213-section/
│
├── README.md                     
├── data_cleaning.qmd   
├── sections.sql
├── query_and_viz.qmd
├── dependencies.txt
|
├── data/
│   ├── FAOSTAT_data_en_4-1-2025.csv
│   ├── crop_yields.csv
│   ├── crop_prod_clean.csv
│   ├── crop_cal_clean.csv

```

Data is housed within this repository. Please refer to the reference section to find where the data originates from

## References
1. Food and Agriculture Organization of the United Nations FAOSTAT. (n.d.). Crops and livestock products [[Crops and livestock products](https://www.fao.org/faostat/en/#data/QCL)](https://www.fao.org/faostat/en/#data/QCL. Access date: April 3, 2025.
2. Center for Sustainability and the Global Environment (SAGE). (2024, May 15). Crop Calendar Dataset | Center for Sustainability and the Global Environment. Center for Sustainability and the Global Environment. [https://sage.nelson.wisc.edu/data-and-models/datasets/crop-calendar-dataset/](https://sage.nelson.wisc.edu/data-and-models/datasets/crop-calendar-dataset/). Access date: April 3, 2025.

### Acknowledgements
All materials were created by [Julien Brun](https://github.com/brunj7) & [Greg Janee](https://github.com/gjanee) for EDS 213: Databases and Data Management from the Master 
in Environmental Data Science ([MEDS](https://bren.ucsb.edu/masters-programs/master-environmental-data-science)) at the Bren School of Environmental Science & Management, University California at Santa Barbara.

*For additional information on the dependencies and libraries necessary in R, please see the dependencies text file*

