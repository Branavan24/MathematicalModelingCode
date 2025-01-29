t_vals <- seq(0, 10, by = 1)
p_initial <- 0.1
r <- 1
p_vals <- rep(NA, times = length(t_vals))
p_vals[1] <- p_initial
for (t in 1:(length(t_vals) - 1)) { 
  p_vals[t+1] <- p_vals[t]+ r * (1 - p_vals[t])*p_vals[t] 

}
plot(t_vals, p_vals, type = "p",
     main = "Predictions of the discrete logistic growth model",
     xlab = "Day", ylab = "Population Size")