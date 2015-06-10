clear all;
close all;
clc;
active_data= [1849
1757
1845
1960
2103
2075
2135
2165
2412
2666
2985
3299
3589
3948
4328
4778
5313
5761
6285
6719
7186
7812
8392
8997
9381
9846
10268
10835
11421
11848
12313
12597
13073
13493
14114
14335
14694
14975
15398
15654
16030
16258
16627
16845
17036
17396
17715
17846
18090
18272
18398
18722
19017
19161
19390
19464
19675
19881
20132
20349
20454
20527
20583
20808
21165
21450
21294
21441
21519
21683
21913
22036
22188
22269
22295
22425
22655
22770
22883
22937
22941
23155
23377
23494
23595
23662
23658
23845
23989
24252
24245
24302
24533
24505
24751
24758
24863
24879
24902
25096
25265
25354
25350
25491
25628
25662
25804
25889
26024
25984
26088
26185
26305
26469
26530
26562
26632
26706
26838
27000
27033
27003
27071
27188
27263
27633
27511
27518
27560
27667
27747
27689
27952
27941
27930
28041
28206
28305
28368
28490
28481
28539
28566
28668
28867
28807
28784
28870
28995
29221
29187
29180
29177
29260
29358
29400
29563
29732
29602
29664
29740
29939
29919
29879
30127
29982
30086
30181
30310
30308
30256
30376
30414
30699
30626
30629
30617
30563
30728
30964
30818
30917
30919
31109
31063
31229
31199
31224
31208
31209
31340
31450
31614
31542
31504
31462
31612
31758
31759
31825
31794
31889
31908
31976
32060
32053
32019
31962
32165
32238
32330
32366
32296
32365
32413
32649
32638
32581
32574
32592
32661
32715
32794
32827
32840
32748
32891
33046
33122
32996
32991
33086
33056
33234
33273
33304
33262
33233
33326
33429
33442
33464
33423
33397
33520
33577
33720
33635
33671
33666
];
reference_data=[1781
1797
1786
1862
1820
1971
2049
2149
2420
2785
3254
3591
4014
4561
5185
5934
6563
7275
7927
8718
9473
10258
10996
11819
12500
13347
13900
14598
15284
16013
16581
17135
17780
18417
18981
19467
19908
20355
20849
21314
21797
22080
22479
22705
23112
23466
23866
24165
24363
24633
24813
25093
25400
25572
25786
25856
26113
26375
26359
26754
26886
27051
27193
27383
27563
27704
27632
27888
27987
28258
28390
28530
28672
28639
28874
29195
29189
29306
29322
29412
29559
29689
29744
30014
30035
30021
30200
30358
30533
30607
30708
30684
30825
30956
31160
31215
31229
31315
31381
31555
31762
31848
31824
31887
31925
32075
32256
32360
32378
32434
32494
32655
32745
32902
32932
32955
33038
33158
33271
33327
33436
33438
33518
33591
33781
33751
33858
33877
33927
34047
34220
34311
34364
34374
34272
34571
34692
34685
34804
34813
34848
34975
35094
35131
35230
35163
35374
35382
35474
35704
35623
35543
35600
35746
35855
36069
36009
36102
36180
36160
36297
36361
36449
36417
36510
36519
36659
36770
36751
36777
36958
36897
37062
37100
37098
37152
37070
37221
37312
37473
37467
37348
37486
37537
37592
37804
37750
37854
37728
37856
37970
38063
38099
38069
38097
38150
38187
38344
38363
38346
38500
38431
38476
38572
38650
38629
38647
38700
38717
38864
38901
38935
38885
38964
39017
39097
39209
39218
39342
39232
39310
39453
39445
39440
39511
39492
39570
39828
39708
39706
39677
39717
39840
40025
39969
39932
39845
40015
40045
40131
40193
40173
40195
40113
40276
40364
40427
40423
40388
40358
];
active_data=active_data';
reference_data=reference_data';
x=active_data;
delta=160e-3;
fs=1/delta;
X=1/length(x)*fft(x,size(x,2));
Xa=abs(X);
fx=linspace(-fs/2,fs/2,length(X));
grid on;
% [freqx ampx]=ginput
value_active=max(Xa)

y=reference_data;
delta=160e-3;
fs=1/delta;
Y=1/length(y)*fft(y,size(y,2));
Ya=abs(Y);
fy=linspace(-fs/2,fs/2,length(Y));
value_ref=max(Ya)


hold on;
stem(x,'r');
stem (y,'k');
legend('Active sampled data','Reference sampled data');

figure;
subplot(211);
stem(fx,fftshift(Xa));
title('Active Channel');
xlabel('frequency in Hz');
ylabel('Magnitude')
axis([-0.02 0.02 0 4e4])
grid on;
[freqx ampx]=ginput

subplot(212);
stem(fy,fftshift(Ya));
title('Reference Channel');
xlabel('frequency in Hz');
ylabel('Magnitude')
axis([-0.5 0.5 0 4e4])
grid on;
% [freqy ampy]=ginput

