r_vals <- seq(0, 2, by = 0.01)
t_vals <- seq(0, 1000, by = 1)
p_vals <- matrix(NA, # this tells R what we want to put in the matrix
                 nrow = length(r_vals), # this tells R how many rows we want
                 ncol = length(t_vals)) # this tells R how many columns we want
p_init <- 0.25
# We now want to fill the first column of each row of our matrix with this
# initial condition. To index a matrix in R, we use the syntax [m,n] where
# m denotes the row number and n denotes the column number. If we want to
# denote all rows (or all columns) we can leave the corresponding index blank.
p_vals[,1] <- p_init # this puts p_init in the first column of each row
for (r in 1:length(r_vals)) { # this loops through all r values
  for (t in 1:(length(t_vals) - 1)) { # this loops through all time steps
    # we record the simulation results within the r-th row of our matrix
    p_vals[r,t+1] <- p_vals[r,t] + r_vals[r]*(1 - p_vals[r,t])*p_vals[r,t]
    # like vectors we previously used, we can used [i] to assign value to or
    # pick value from a specific element with index i. For matrix, we have to
    # specify two index [i,j] to locate a specific element, where i represent
    # the i-th row and j represent the j-th row.
  }
}
# we'll setup the plot using the results for the first r value in our list
plot(rep(r_vals[1], 100), p_vals[1,902:1001], type = "p", xlim = c(-3, 3),
     ylim = c(-0.4, 1.4), xlab = "r", ylab = "p*")
# then we'll loop through each of our other r values and add them to the plot;
# we use the points() function which adds the data to the current plot as
# points without starting a new plot (if we used plot() it would create a
# new plot window each time instead of putting them all on the same plot)
for (r in 2:length(r_vals)) {
  points(rep(r_vals[r], 100), p_vals[r,902:1001])
}