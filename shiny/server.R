library(shiny)
#ChickWeight

shinyServer(
						function(input, output) 
						{
							output$boxplots <- renderPlot({
								weight1 = ChickWeight[ChickWeight$Time==input$time & ChickWeight$Diet == input$diet1,"weight"]
								weight2 = ChickWeight[ChickWeight$Time==input$time & ChickWeight$Diet == input$diet2,"weight"]
								pval = sprintf("%.3f", wilcox.test(weight1, weight2, exact=FALSE)$p.value)

								boxplot(weight1, weight2, xlab="Diet", ylab="Weight (g)", names=c(input$diet1, input$diet2), main = paste0("Chick Weight at ", input$time, " Days Between Diet ", input$diet1, " and Diet ", input$diet2, "\n 2 sided Wilcoxon p-value = ", pval))
							})
						}
						)
