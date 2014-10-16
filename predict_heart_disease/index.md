---
title       : Prevent Heart Disease
subtitle    : Assess the probability of having a Coronary Heart Disease
author      : Cristian Mastrofrancesco
job         : statistician
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## CHD

* We have built a risk assessment tool for estimating
a person 10-year risk of having a heart attack

* Heart disease has been the leading cause of death
worldwide

* Risk factors are variables that increase the chances of a
disease

* Key to successful prediction of CHD: identifying the most
important risk factors


---

## Risk factors

We took into account different features:
+ demographic
+ behavioral
+ medical history
+ last blood test results

---

## Modeling CHD

We use logistic regression on training set to predict
whether or not a patient experienced CHD within 10
years of first examination.

The model can differentiate low-risk from high-risk
patients.
