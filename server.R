shinyServer(function(input, output, session) {
  # The combined kernel function, based on three gaussians.
  comb <- function(x) {
    return(
      dnorm(x,  mean=input$mean1, sd=input$sd1)+
        dnorm(x,  mean=input$mean2, sd=input$sd2)+
        dnorm(x,  mean=input$mean3, sd=input$sd3))
  } 
  
  # The range to plot over.
  x <- seq(-4, 4, length=100)
  
  # Render the three component Gaussians along with the composit.
  output$plot1 <- renderPlot({
    colors <- c("red", "blue", "darkgreen", "black")
    labels <- c(
      #paste(expression(mu),"=",as.character(input$mean1),",",expression(sigma),"=",input$sigma1), 
      bquote(paste("Gaussian #1(", mu == .(input$mean1),",",sigma == .(input$sd1),")")),
      bquote(paste("Gaussian #2(", mu == .(input$mean2),",",sigma == .(input$sd2),")")),
      bquote(paste("Gaussian #3(", mu == .(input$mean3),",",sigma == .(input$sd3),")")),
      expression(paste("Combined Kernel")))
    
    plot(x, comb(x), type="l", lty=2, xlab="x value", ylim=c(-0.01,1.5), xlim=c(-4,4),
         ylab="y")
    
    lines(x, dnorm(x,  mean=input$mean1, sd=input$sd1), lwd=2, col=colors[1])
    lines(x, dnorm(x,  mean=input$mean2, sd=input$sd2), lwd=2, col=colors[2])
    lines(x, dnorm(x,  mean=input$mean3, sd=input$sd3), lwd=2, col=colors[3])
    
    # Provide a legend.
    legend("topright", inset=.05, title="Parameters",
           labels, lwd=2, lty=c(1, 1, 1, 2), col=colors)
    })

})
