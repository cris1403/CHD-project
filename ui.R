library(shiny)
shinyUI(fluidPage(
  
  titlePanel("Predicting Coronary Heart Disease"),
  
  sidebarLayout(
    sidebarPanel(
      helpText(h4("Demographic risk factors", style = "color:red")),
      
      radioButtons("checkSex", label = strong("Sex"), choices = list("Male" = 1, "Female" = 0), selected = 1, inline = TRUE),    
      numericInput("age", label = strong("Age"), value=18),
      radioButtons("education", label = strong("Highest Level of Education"), 
                   choices = list("Some high school" = 1, "High school" = 2, "Undergraduate" = 3, "Graduate" = 4), selected = 1),
      br(),
      helpText(h4("Behavioral risk factors", style = "color:red")),
      
      radioButtons("smoker", label = strong("Smoker"), choices = list("Yes" = 1, "No" = 0), selected = 0, inline = TRUE),
      sliderInput("cigs", label = strong("Cigarettes per day"), min = 0,max = 70, value = 0),
      br(),
      helpText(h4("Medical history risk factors", style = "color:red")), 
      
      radioButtons("bpmeds", label = strong("On blood pressure medication at time of 1st examination"), choices = list("Yes" = 1, "No" = 0), selected = 0, inline = TRUE),
      radioButtons("prevstroke", label = strong("Previously had a stroke"), choices = list("Yes" = 1, "No" = 0), selected = 0, inline = TRUE),
      radioButtons("prevhyp", label = strong("Currently hypertensive"), choices = list("Yes" = 1, "No" = 0), selected = 0, inline = TRUE),
      radioButtons("diabetes", label = strong("Currently has diabetes"), choices = list("Yes" = 1, "No" = 0), selected = 0, inline = TRUE),
      br(),
      helpText(h4("Other risk factors", style = "color:red")),
       
      numericInput("totchol", label = strong("Total cholesterol (mg/dL)"), value=0),     
      numericInput("sysbp", label = strong("Systolic blood pressure"), value=0),      
      numericInput("diabp", label = strong("Diastolic blood pressure"), value=0),    
      numericInput("bmi", label = strong("Body Mass Index"), value=0),      
      numericInput("hrate", label = strong("Heart rate (beats/minute)"), value=0),      
      numericInput("glucose", label = strong("Blood glucose level (mg/dL)"), value=0),
      br(),
      submitButton('Submit')
      ),
    
    mainPanel(
      br(),
      p("We use this application to ", span("predict the 10-year risk of Coronary Heart Disease. ", style="color:blue"), "CHD is a 
        disease of the blood vessels supplying the heart. It has been the leading cause of death worldwide and high levels of", span("risk factors", style = "color:blue"),
        "increase the probability of experiencing such a disease."),
      p("In this application, we have used a ", span("logistic regression model ", style ="color:blue"),"to predict the probability a patient will experience 
        CHD within 10 years from this examination."),
      p("As you can see on the left panel, we have taken into account demographic, behavioral, medical history risk factors and other features. The most dangerous risk factors according to several past studies are smoking, cholesterol, glucose 
        and systolic blood pressure."),
      p("Here you find some additional information:"),
      p("* Total cholesterol greater than 240 mg/dL is high; less than 200 mg/dL is desiderable."),
      p("* Systolic blood pressure is considered normal when is less than 120."),
      p("* Diastolic blood pressure is considered normal when is less than 80."),
      p("* Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.
        As your body mass index rises, so does your risk for coronary heart disease (CHD). To compute your BMI, visit the ",
        a("NIH web page", href="http://www.nhlbi.nih.gov/health/educational/lose_wt/BMI/bmicalc.htm"), "."),
      p("* A normal blood glucose level is about 70-100."),
      p("Fill the form and press the submit button and get the prediction of having CHD in the next 10 years.
        Try to lower down the most dangerous risk factors and check if and how much the probability of having CHD goes down."),
      br(),
      h4("Result of prediction", style = "color:red"),
      p("Your predicted risk (from 0 to 1) of having a Coronary Heart Disease in the next 10 years is:"),
      
      verbatimTextOutput("prediction")
      )
  )
))