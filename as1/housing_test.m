testMatrix = [0.84054, 0.00, 8.140, 0, 0.5380, 5.5990, 85.70, 4.4546, 4, 307.0, 21.00, 303.42, 16.51, 13.90;
0.67191, 0.00, 8.140, 0, 0.5380, 5.8130, 90.30, 4.6820, 4, 307.0, 21.00, 376.88, 14.81, 16.60;
0.95577, 0.00, 8.140, 0, 0.5380, 6.0470, 88.80, 4.4534, 4, 307.0, 21.00, 306.38, 17.28, 14.80;
0.77299, 0.00, 8.140, 0, 0.5380, 6.4950, 94.40, 4.4547, 4, 307.0, 21.00, 387.94, 12.80, 18.40;
1.00245, 0.00, 8.140, 0, 0.5380, 6.6740, 87.30, 4.2390, 4, 307.0, 21.00, 380.23, 11.98, 21.00;
0.22927, 0.00, 6.910, 0, 0.4480, 6.0300, 85.50, 5.6894, 3, 233.0, 17.90, 392.74, 18.80, 16.60;
0.25387, 0.00, 6.910, 0, 0.4480, 5.3990, 95.30, 5.8700, 3, 233.0, 17.90, 396.90, 30.81, 14.40;
0.21977, 0.00, 6.910, 0, 0.4480, 5.6020, 62.00, 6.0877, 3, 233.0, 17.90, 396.90, 16.20, 19.40;
0.10153, 0.00, 12.830, 0, 0.4370, 6.2790, 74.50, 4.0522, 5, 398.0, 18.70, 373.66, 11.97, 20.00;
0.08707, 0.00, 12.830, 0, 0.4370, 6.1400, 45.80, 4.0905, 5, 398.0, 18.70, 386.96, 10.27, 20.80;
0.05646, 0.00, 12.830, 0, 0.4370, 6.2320, 53.70, 5.0141, 5, 398.0, 18.70, 386.40, 12.34, 21.20;
0.08387, 0.00, 12.830, 0, 0.4370, 5.8740, 36.60, 4.5026, 5, 398.0, 18.70, 396.06, 9.10, 20.30;
0.04113, 25.00, 4.860, 0, 0.4260, 6.7270, 33.50, 5.4007, 4, 281.0, 19.00, 396.90, 5.29, 28.00;
0.14866, 0.00, 8.560, 0, 0.5200, 6.7270, 79.90, 2.7778, 5, 384.0, 20.90, 394.76, 9.42, 27.50;
0.11432, 0.00, 8.560, 0, 0.5200, 6.7810, 71.30, 2.8561, 5, 384.0, 20.90, 395.58, 7.67, 26.50;
0.22876, 0.00, 8.560, 0, 0.5200, 6.4050, 85.40, 2.7147, 5, 384.0, 20.90, 70.80, 10.63, 18.60;
0.21161, 0.00, 8.560, 0, 0.5200, 6.1370, 87.40, 2.7147, 5, 384.0, 20.90, 394.47, 13.44, 19.30;
0.59005, 0.00, 21.890, 0, 0.6240, 6.3720, 97.90, 2.3274, 4, 437.0, 21.20, 385.76, 11.12, 23.00;
0.32982, 0.00, 21.890, 0, 0.6240, 5.8220, 95.40, 2.4699, 4, 437.0, 21.20, 388.69, 15.03, 18.40;
0.97617, 0.00, 21.890, 0, 0.6240, 5.7570, 98.40, 2.3460, 4, 437.0, 21.20, 262.76, 17.31, 15.60;
0.55778, 0.00, 21.890, 0, 0.6240, 6.3350, 98.20, 2.1107, 4, 437.0, 21.20, 394.67, 16.96, 18.10;
0.32264, 0.00, 21.890, 0, 0.6240, 5.9420, 93.50, 1.9669, 4, 437.0, 21.20, 378.25, 16.90, 17.40;
2.15505, 0.00, 19.580, 0, 0.8710, 5.6280, 100.00, 1.5166, 5, 403.0, 14.70, 169.27, 16.65, 15.60;
2.36862, 0.00, 19.580, 0, 0.8710, 4.9260, 95.70, 1.4608, 5, 403.0, 14.70, 391.71, 29.53, 14.60;
1.80028, 0.00, 19.580, 0, 0.6050, 5.8770, 79.20, 2.4259, 5, 403.0, 14.70, 227.61, 12.14, 23.80;
2.30040, 0.00, 19.580, 0, 0.6050, 6.3190, 96.10, 2.1000, 5, 403.0, 14.70, 297.09, 11.10, 23.80;
2.44953, 0.00, 19.580, 0, 0.6050, 6.4020, 95.20, 2.2625, 5, 403.0, 14.70, 330.04, 11.32, 22.30;
1.20742, 0.00, 19.580, 0, 0.6050, 5.8750, 94.60, 2.4259, 5, 403.0, 14.70, 292.29, 14.43, 17.40;
0.12579, 45.00, 3.440, 0, 0.4370, 6.5560, 29.10, 4.5667, 5, 398.0, 15.20, 382.84, 4.56, 29.80;
0.08370, 45.00, 3.440, 0, 0.4370, 7.1850, 38.90, 4.5667, 5, 398.0, 15.20, 396.90, 5.39, 34.90;
0.09068, 45.00, 3.440, 0, 0.4370, 6.9510, 21.50, 6.4798, 5, 398.0, 15.20, 377.68, 5.10, 37.00;
0.06911, 45.00, 3.440, 0, 0.4370, 6.7390, 30.80, 6.4798, 5, 398.0, 15.20, 389.71, 4.69, 30.50;
0.08664, 45.00, 3.440, 0, 0.4370, 7.1780, 26.30, 6.4798, 5, 398.0, 15.20, 390.49, 2.87, 36.40;
0.35809, 0.00, 6.200, 1, 0.5070, 6.9510, 88.50, 2.8617, 8, 307.0, 17.40, 391.70, 9.71, 26.70;
0.40771, 0.00, 6.200, 1, 0.5070, 6.1640, 91.30, 3.0480, 8, 307.0, 17.40, 395.24, 21.46, 21.70;
0.62356, 0.00, 6.200, 1, 0.5070, 6.8790, 77.70, 3.2721, 8, 307.0, 17.40, 390.39, 9.93, 27.50;
0.19073, 22.00, 5.860, 0, 0.4310, 6.7180, 17.50, 7.8265, 7, 330.0, 19.10, 393.74, 6.56, 26.20;
0.14030, 22.00, 5.860, 0, 0.4310, 6.4870, 13.00, 7.3967, 7, 330.0, 19.10, 396.28, 5.90, 24.40;
0.21409, 22.00, 5.860, 0, 0.4310, 6.4380, 8.90, 7.3967, 7, 330.0, 19.10, 377.07, 3.59, 24.80;
0.08221, 22.00, 5.860, 0, 0.4310, 6.9570, 6.80, 8.9067, 7, 330.0, 19.10, 386.09, 3.53, 29.60;
0.36894, 22.00, 5.860, 0, 0.4310, 8.2590, 8.40, 8.9067, 7, 330.0, 19.10, 396.90, 3.54, 42.80;
0.65665, 20.00, 3.970, 0, 0.6470, 6.8420, 100.00, 2.0107, 5, 264.0, 13.00, 391.93, 6.90, 30.10;
0.54011, 20.00, 3.970, 0, 0.6470, 7.2030, 81.80, 2.1121, 5, 264.0, 13.00, 392.80, 9.59, 33.80;
0.01096, 55.00, 2.250, 0, 0.3890, 6.4530, 31.90, 7.3073, 1, 300.0, 15.30, 394.72, 8.23, 22.00;
0.01965, 80.00, 1.760, 0, 0.3850, 6.2300, 31.50, 9.0892, 1, 241.0, 18.20, 341.60, 12.93, 20.10;
0.03871, 52.50, 5.320, 0, 0.4050, 6.2090, 31.30, 7.3172, 6, 293.0, 16.60, 396.90, 7.14, 23.20;
0.04301, 80.00, 1.910, 0, 0.4130, 5.6630, 21.90, 10.5857, 4, 334.0, 22.00, 382.80, 8.05, 18.20;
0.10659, 80.00, 1.910, 0, 0.4130, 5.9360, 19.50, 10.5857, 4, 334.0, 22.00, 376.04, 5.57, 20.60;
8.98296, 0.00, 18.100, 1, 0.7700, 6.2120, 97.40, 2.1222, 24, 666.0, 20.20, 377.73, 17.60, 17.80;
3.84970, 0.00, 18.100, 1, 0.7700, 6.3950, 91.00, 2.5052, 24, 666.0, 20.20, 391.34, 13.27, 21.70;
5.20177, 0.00, 18.100, 1, 0.7700, 6.1270, 83.40, 2.7227, 24, 666.0, 20.20, 395.43, 11.48, 22.70;
4.26131, 0.00, 18.100, 0, 0.7700, 6.1120, 81.30, 2.5091, 24, 666.0, 20.20, 390.74, 12.67, 22.60
18.49820, 0.00, 18.100, 0, 0.6680, 4.1380, 100.00, 1.1370, 24, 666.0, 20.20, 396.90, 37.97, 13.80
19.60910, 0.00, 18.100, 0, 0.6710, 7.3130, 97.90, 1.3163, 24, 666.0, 20.20, 396.90, 13.44, 15.00
14.43830, 0.00, 18.100, 0, 0.5970, 6.8520, 100.00, 1.4655, 24, 666.0, 20.20, 179.36, 19.78, 27.50
51.13580, 0.00, 18.100, 0, 0.5970, 5.7570, 100.00, 1.4130, 24, 666.0, 20.20, 2.60, 10.11, 15.00
14.05070, 0.00, 18.100, 0, 0.5970, 6.6570, 100.00, 1.5275, 24, 666.0, 20.20, 35.05, 21.22, 17.20
18.81100, 0.00, 18.100, 0, 0.5970, 4.6280, 100.00, 1.5539, 24, 666.0, 20.20, 28.79, 34.37, 17.90
28.65580, 0.00, 18.100, 0, 0.5970, 5.1550, 100.00, 1.5894, 24, 666.0, 20.20, 210.97, 20.08, 16.30
12.24720, 0.00, 18.100, 0, 0.5840, 5.8370, 59.70, 1.9976, 24, 666.0, 20.20, 24.65, 15.69, 10.20
37.66190, 0.00, 18.100, 0, 0.6790, 6.2020, 78.70, 1.8629, 24, 666.0, 20.20, 18.82, 14.52, 10.90;
7.36711, 0.00, 18.100, 0, 0.6790, 6.1930, 78.10, 1.9356, 24, 666.0, 20.20, 96.73, 21.52, 11.00
10.67180, 0.00, 18.100, 0, 0.7400, 6.4590, 94.80, 1.9879, 24, 666.0, 20.20, 43.06, 23.98, 11.80;
6.28807, 0.00, 18.100, 0, 0.7400, 6.3410, 96.40, 2.0720, 24, 666.0, 20.20, 318.01, 17.79, 14.90;
9.92485, 0.00, 18.100, 0, 0.7400, 6.2510, 96.60, 2.1980, 24, 666.0, 20.20, 388.52, 16.44, 12.60;
3.16360, 0.00, 18.100, 0, 0.6550, 5.7590, 48.20, 3.0665, 24, 666.0, 20.20, 334.40, 14.13, 19.90;
3.77498, 0.00, 18.100, 0, 0.6550, 5.9520, 84.70, 2.8715, 24, 666.0, 20.20, 22.01, 17.15, 19.00;
4.42228, 0.00, 18.100, 0, 0.5840, 6.0030, 94.50, 2.5403, 24, 666.0, 20.20, 331.29, 21.32, 19.10
15.57570, 0.00, 18.100, 0, 0.5800, 5.9260, 71.00, 2.9084, 24, 666.0, 20.20, 368.74, 18.13, 19.10;
0.10574, 0.00, 27.740, 0, 0.6090, 5.9830, 98.80, 1.8681, 4, 711.0, 20.10, 390.11, 18.07, 13.60;
0.11132, 0.00, 27.740, 0, 0.6090, 5.9830, 83.50, 2.1099, 4, 711.0, 20.10, 396.90, 13.35, 20.10;
0.17331, 0.00, 9.690, 0, 0.5850, 5.7070, 54.00, 2.3817, 6, 391.0, 19.20, 396.90, 12.01, 21.80;
0.27957, 0.00, 9.690, 0, 0.5850, 5.9260, 42.60, 2.3817, 6, 391.0, 19.20, 396.90, 13.59, 24.50;
0.17899, 0.00, 9.690, 0, 0.5850, 5.6700, 28.80, 2.7986, 6, 391.0, 19.20, 393.29, 17.60, 23.10];