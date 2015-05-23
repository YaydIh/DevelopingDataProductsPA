directionsText <- paste("
  The input panel on the left consist of two
  sections.

  The one with the title "Red Graph" controls the
  display on the top histogram in the 'Plots'
  panel.  The bars of that histogram are colored
  red.

  The section with the title "Green Graph"
  controls the display on the middle of the three
  graphs in the "Plots' tab.  The bars of that
  histogram are colored green.

  The bottom graph, colored with blue bars, does
  not change in response to any input.  It always
  represents the totatlity of data.

  Each sections consists of a collection of
  checkboxes, one for each day of the week.  A
  selected box with a checkmark in it, means the
  data from that day of the week will be included
  in the histogram. When the shiny app is the
  active window, the checkbox will also appear
  blue.

  As you check or uncheck a box, the graph will
  change immediately.  There is no submit button
  that needs to be checked.
")

