library(shiny)
library(RCurl)

# this code will run once

framingham = read.csv("data/framingham.csv", stringsAsFactors=TRUE)
framingham$male = as.factor(framingham$male)
framingham$education = as.factor(framingham$education)
framingham$currentSmoker = as.factor(framingham$currentSmoker)
framingham$BPMeds = as.factor(framingham$BPMeds)
framingham$prevalentStroke = as.factor(framingham$prevalentStroke)
framingham$prevalentHyp = as.factor(framingham$prevalentHyp)
framingham$diabetes = as.factor(framingham$diabetes)

modFit = glm(TenYearCHD ~ ., data = framingham, family = binomial)

shinyServer(
  function(input, output) {
    
    # this code will run once each page refresh
    # code in reactive functions run each time you put a new value
    
    output$prediction = renderPrint({ 
                male = input$checkSex
                age = input$age
                education = input$education
                currentSmoker = input$smoker
                cigsPerDay = input$cigs
                BPMeds = input$bpmeds
                prevalentStroke = input$prevstroke
                prevalentHyp = input$prevhyp
                diabetes = input$diabetes
                totChol = input$totchol
                sysBP = input$sysbp
                diaBP = input$diabp
                BMI = input$bmi
                heartRate = input$hrate
                glucose = input$glucose
                predict(modFit, newdata= data.frame(male, age, education, currentSmoker,
                                                    cigsPerDay, BPMeds, prevalentStroke, prevalentHyp,
                                           diabetes, totChol, sysBP, diaBP, BMI, heartRate, glucose),
                        type="response")
    })
  }
)