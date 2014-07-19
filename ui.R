shinyUI(pageWithSidebar(
  headerPanel('Three-Part Gaussian Kernel Experiment'),
  sidebarPanel(
    p('This application allows you to experiment with a Gaussian kernel made up of three individual Gaussian functions.  The three individual Gaussian functions are summed together to produce a composite kernel that can represent a function that contains three individual peaks.  This is useful for continuous ant colony optimization (ACO), see pitch document for more info.'),
    h3('Gaussian Function #1'),
    numericInput('mean1', 'Mean', 0, min=-4, max=4),
    numericInput('sd1', 'Standard Deviation', 1, min=0, max=10),
    h3('Gaussian Function #2'),
    numericInput('mean2', 'Mean', 2, min=-4, max=4),
    numericInput('sd2', 'Standard Deviation', 0.5, min=0, max=10),
    h3('Gaussian Function #3'),
    numericInput('mean3', 'Mean', -2, min=-4, max=4),
    numericInput('sd3', 'Standard Deviation', 1.5, min=0, max=10)
  ),
  mainPanel(
    plotOutput('plot1')
  )
))
