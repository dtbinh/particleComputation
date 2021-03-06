%Factory Size plot



x=[1 3 4 5 6 7 8 9 10 12 14 16 18 20 24 28 30 40 50 60 70 80 90 100 110 120];
y=[56 595 969 1725 2523 3959 5334 7748 9918 16863 26829 40548 58824 82533 150114 251739 318273 862638 1906128 3684243 5931640 9202655 13835395 20194360 28689050 39773965]; %ZigZag Part
% y=log(y);
y1=[56 665 1224 2070 3219 4815 6858 9536 12825 21900 34959 52974 77013 108240 197394 331668 419655 1140570 2524485 4884900 8595315 14089230 21860145 32461560 46506975 64669890]; %Column Part
% y1=log(y1);
y2=[56 490 816 1242 1740 2354 3048 3874 4816 7168 10224 14080 18832 24576 39424 59392 71536 157696 295056 495616 771376 1134336 1596496 2169856 2866416 3698176]; %Row Part
% y2=log(y2);
% plot(x,y,'b',x,y1,'r',x,y2,'m')
figure(8);clf;
semilogy(x,y1,'r',x,y,'b',x,y2,'m','LineWidth',2)
xlabel('Number of Tiles (\it{n})')
ylabel('Factory Size  (rows\bulletcolumns)')
%title('Factory Size Plot')
axis tight
hold on
x1=[21 32 42 60 80 96];
y3=[57420 228705 421412 1868735 3313494 5790854];
% y3=log(y3);
semilogy(x1,y3,'s','MarkerSize',4,...
    'MarkerEdgeColor',[0,0.5,0],...
    'MarkerFaceColor',[1, 1 .2])
legend('Column Polyomino','ZigZag Polyomino','Row Polyomino','Arbitrary Polyomino','Location','SE')
set(gcf,'PaperUnits','inches')
set(gcf,'papersize',[6,3])
set(gcf,'paperposition',[0,0,6,3])
print -dpdf '../pictures/pdf/MaxSizeBlank.pdf'

