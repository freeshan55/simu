%%%%Badam Alivelu Laxmi Mani Harika
%%%%student ID: 20000628-T083


%%%here we are given the pdf function. the pdf function contains an
%%%exponential function.
%%as it is an exponential function we can use inverse transform technique to
%%generate random variates.
%%to use IIT we have to calculate CDF function.
%%I used a website to calculate the CDF
%%https://www.symbolab.com/solver/integral-calculator/%5Cint%5Cleft(%5Cfrac%7B1.5%7D%7B2%7D%5Cright)%5Ccdot%20x%5E%7B0.5%7D%5Ccdot%20e%5E%7B%5Cfrac%7B-x%5E%7B1.5%7D%7D%7B2%7D%7Ddx?or=input
%%the CDF was -0.99999e^{-1/2}x^{1.5}}+C
%%so i have calculated the inverse function using the example in ppt as
%%reference
%%I have attached it to the paper that i have submitted during the exam.
%%a)
R = rand(1,2000);
X = (-2 * log(R)).^(1/1.5);
[bins,p] = acNhist2(X);
figure;
plot(bins,p)
pd = fitdist(X','exponential');

%%%%%%%
%%b)
%%to verify wether the random variates generated in a follow the pdf f I
%%have assumed around few values and substitued in the function
%%and plotted it.
x = 1: 8 :10000;
fun = (1.5/2).*(x.^0.5).*exp(-(x.^1.5)./2);
[bins,p] = acNhist2(fun);
figure;
plot(bins,p)
pd = fitdist(fun','exponential');

%%c)
[co1,lag] = xcorr(X- mean(X),10,'coeff');
tp = find(lag == 1);
figure;
plot(lag,co1);
co1(tp)

%%%the lag-1 correlation value is -0.0290
%%(only considering the absolute value)the value is very low and also the
%%lag values from 1 to 10 are [-0.029,0.0091,0.0060,-0.045,0.00426,0.003,-0.001,0.0142,-0.0173,0.0083]
%%% as we can see all the values are very low
%%therefore we can say that X values are not correlated i.e., they are random and the values can be
%%considered.


