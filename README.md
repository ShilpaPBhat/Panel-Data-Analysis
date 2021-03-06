# Panel-Data-Analysis
----

## Table of contents
* [About](#about)
* [Data Description](#data-description)
* [Methodology](#methodology)
* [Code and Reoprt](#code-and-report)
* [Result](#result)

## About

This exercise was the part of Econometrics and Time Series coursework at The University of Texas at Dallas.

Traffic fatalities are the third-leading cause of death due to injury (non-health and disease related) in the U.S <br>
One of the reason could be traffic fatalities due to drunk driving. One third of traffic fatalities are due to drunk driving.
So here in this project we are analyzing how do druk driving laws affect traffic deaths.

## Data Description

The data was obtained from U.S. department of Transportation Fatal Accident Reporting System, U.S. Bureau of Economic Analysis and U.S. Bureau of Labor Statistics.

The [data](https://github.com/ShilpaPBhat/Panel-Data-Analysis/tree/master/data) present here for 48 states in the US for the timeframe of 1982 to 1988 which is a panel data

## Methodology
* Performed few descriptive analysis, to understand the different variables and the effects these have in different range over the fatality rate.
* Hypothesis testing.
* Considering traffic fatality rate as dependent variable, regressed on the independent variables that could affect the traffic fatality rate based on the intution and the descriptive analysis. Since this is a Panel data Pooled OLS model leads to heterogeneity due to unobserved characteristics. To control for the unobserved heterogeneity we used Fixed Effect model and there could be presence of variable which vary over time but are constant over entities, to check the effect of variables over time we used Random Effect model.

## Code and Report

You can have a look at complete code and report [here](https://github.com/ShilpaPBhat/Panel-Data-Analysis/blob/master/code_report/EconometricFinalProject.pdf)

## Result
Fixed effect model with entity and time fixed effect is our best model. From our analysis and the data given we can infer that drunk driving laws may have impact on vehicle fatalities but we cannot clearly conclude.



