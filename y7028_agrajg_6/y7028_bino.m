x = [0:1:50]
y = binopdf(x,50,0.2);
sum_under_bino = sum(y)
plot (x,y,'o');
print y7028_octave_y.eps;
h1 = binornd (50,0.2,100,1);

hist1 = hist (h1,x,1);
bar(x,hist1);
print y7028_octave_hist1.eps;
h2 = binornd (50,0.2,3*10^3,1);

hist2 = hist (h2,x,1);
bar(x,hist2);
print y7028_octave_hist2.eps;
h3 = binornd (50,0.2,10^5,1);

hist3 = hist (h3,x,1);
bar(x,hist3);
print y7028_octave_hist3.eps;

plot (x,y,'-o');
hold on;
bar(x,hist1,"@2");
hold off;
print y7028_octave_yhist1.eps;

plot (x,y,'-o');
hold on;
bar(x,hist2,"@2");
hold off;
print y7028_octave_yhist2.eps;

plot (x,y,'-o');
hold on;
bar(x,hist3,"@2");
hold off;
print y7028_octave_yhist3.eps;

# plot (x,y,'o');
# hold on;
# plot (x,hist1,"-@2");
# plot (x,hist2,"-x");
# plot (x,hist3,"-o");
# hold off;
plot (x,y, "o-;y;", x, hist1, "x-;hist1;", x, hist2, "*-;hist2;", x, hist3, "x-@2;hist3;");
print y7028_octave_(vi).eps;

A = [transpose(x),transpose(y),transpose(hist1),transpose(hist2),transpose(hist3)]
save y7028_data.dat A 

