# You may need this setup
using Plots
gr() # Activate the GR backend for use with Plots

using DelimitedFiles
data_tofit=DelimitedFiles.readdlm("Week3_PR_Data.dat",'\t')

for aa = 1:15
    print(data_tofit[aa,:],"\n")
end

data_tofit = [0.126800483    -1.641695388; 
              0.501309281  -0.977697538; 
              1.528012113   0.52771122;
              1.70012253    1.711524991; 
              1.992493625   1.891000015;
              2.706075824  -0.463427794;
              2.994931927  -0.443566619;
              3.491852811  -1.275179133;
              3.501191722  -0.690499597;
              4.459924502  -5.516130799;
              4.936965851  -6.001703074;
              5.023289852  -8.36416901;
              5.04233698   -7.924477517;
              5.50739285  -10.77482371;
              5.568665171 -10.9171878]

# Create the arrays x and y, assigning x the first column of data_tofit and y the second column
x_data=data_tofit[:,1]
y_data=data_tofit[:,2]

# Plot the x and y data points using a scatter plot of the x and y array variables
plot(x_data,y_data,label=false, title="Scatter Plot",aspectratio=1,line=(:scatter))

# Create a function called parabfit, with x as the argument, returning a*x^2 + b*x + c
function parabfit(x)
    arr = Array{Any}(undef,size(x))
    i=0
    for k in x
        l=a*k^2+b*k+c
        i=i+1
        arr[i]=l
    end
    return arr
end



# Let's check that we do get a reasonable parabola. Choose your own interval [xmin, xmax] and parameters a, b, c. If it looks too much like a straight line, chance your choices until it does.

# Create variables a, b and c, assigning each the value 1
a = 1
b = 1
c = 1

# Plot the function parabfit, for x values between -5 and 5 
x2 = range(-5., stop=5., step=1)
y2 = parabfit(x2)
plot(x2,y2,label=false,linewidth=4)



# Now we choose a, b, c and plot the curve together with the points.

# Note that by looking at where the data points lie, we can deduce some of the properties for a, b, c, as follows.

# The plot must have a y-intersection that is close to 0, so c is close to 0. Also, the parabola is open downwards, so a must be negative. Finally, it has its maximum at a positive x, so b must be positive.

# Use plot() to start with the scatter plot and plot!() to add the curve for parabfit. (There are other ways to do this ...)

# More plot!() tries.
 a,b,c = -0.95,3.5,-1.5
plot(x_data,y_data,label=false, title="Scatter Plot"
    ,aspectratio=1,line=(:scatter),
    grid=false,markercolor=:red,markersize=4,
    marker=:square)
x2 = range(-5., stop=6.0, step=1)
y2 = parabfit(x2)
plot!(x2,y2,linewidth=2,label=false,
    title="Combined Plot of ax^2+bx+c(Where a=-0.95,b=3.5,c=-1.5)",
    xlabel="x",ylabel="f(x)",
    linecolor=:green)



# From the data points and the scatter plot using the data points, it was clear that it was a downward parabola. So, for a downward parabola, the value of 'a' should be negative and the values of b and where close to 0. So, adjusting various values, I arrived at the perfect fit by taking, a= -0.95, b=3.5, c=-1.5.




