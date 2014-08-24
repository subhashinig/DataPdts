library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Effect of Diet on Chick Weight"),
  sidebarPanel(
							 h4("Select Age and 2 Diets for comparison"),
							 radioButtons("diet1", "Diet 1:", sort(unique(ChickWeight$Diet)), selected=min(levels(ChickWeight$Diet)), inline=T),
							 radioButtons("diet2", "Diet 2:", sort(unique(ChickWeight$Diet)), selected=max(levels(ChickWeight$Diet)), inline=T),
							 sliderInput("time", "Age (days): ", min=0, max=20, step=2, value=20)
  ),
  mainPanel(
						h3("ChickWeight"),
						p("This web application plots the difference in weight of chicks on 4 different diets from 0 to 20 days after birth, and calculates a Wilcoxon p-value between the sets of weights to determine significant differences between the chicks' weights."),
						p("Uses the ChickWeight dataset included in R 3.1.1."),
						plotOutput('boxplots'),
						h4("Instructions"),
						p("Select any 2 diets for comparison using the radio buttons, then use the slider to select the number of days since birth the weight was measured."),
						p("Boxplots will be draw showing the weights of chicks for the selected diets at the selected age. The Wilcoxon p-value is displayed in the graph title")
  )
))
