base='C:\Users\tfs94\Desktop\Prog2'; %Canviar per a cada PC
addpath(genpath(base))
cd(base)

basefingerDS1=strcat(base,'\Dataset I (simple bkg)\Fingers\');
basefingerDS2=strcat(base,'\Dataset II (complex bkg)\Fingers\');



baseDS1=strcat(base,'\Dataset I (simple bkg)\Images\');
baseDS2=strcat(base,'\Dataset II (complex bkg)\Images\');

basetestDS1=strcat(base,'\Dataset I (simple bkg)\test\Test-Images\');
basetestDS2=strcat(base,'\Dataset II (complex bkg)\test\Test-Images\');

basemaskIdDS1=strcat(base,'\Dataset I (simple bkg)\Masks-Ideal\');
basemaskIdDS2=strcat(base,'\Dataset II (complex bkg)\Masks-Ideal\');

basemaskDS1=strcat(base,'\Dataset I (simple bkg)\Masks\');
basemaskDS2=strcat(base,'\Dataset II (complex bkg)\Masks\');

basemaskTestDS1=strcat(base,'\Dataset I (simple bkg)\test\Test-Masks\');
basemaskTestDS2=strcat(base,'\Dataset II (complex bkg)\test\Test-Masks\');

basemaskIDtestDS1=strcat(base,'\Dataset I (simple bkg)\test\Test-Masks-Ideal\');
basemaskIDtestDS2=strcat(base,'\Dataset II (complex bkg)\test\Test-Masks-Ideal\');

tic
histpell1=alg01(baseDS1, basemaskIdDS1);
time_elpased_histDS1=toc;
tic
histpell2=alg01(baseDS2, basemaskIdDS2);
time_elpased_histDS2=toc;

tic
masksTestDS1=alg03(histpell1,basetestDS1,basemaskTestDS1);
time_elpased_masksTestDS1=toc;

tic
masksTestDS2=alg03(histpell2,basetestDS2,basemaskTestDS2);
time_elpased_masksTestDS2=toc;

tic
masksDS1=alg03(histpell1,baseDS1,basemaskDS1);
time_elpased_masksDS1=toc;

tic
masksDS2=alg03(histpell2,baseDS2,basemaskDS2);
time_elpased_masksDS2=toc;

tic
[fscoreTestDS1, precTestDS1, recTestDS1, fsTestDS1]=alg04(basemaskIDtestDS1,masksTestDS1);
time_elpased_fsTestDS1=toc;

tic
[fscoreTestDS2, precTestDS2, recTestDS2, fsTestDS2]=alg04(basemaskIDtestDS2,masksTestDS2);
time_elpased_fsTestDS2=toc;

[fscoreDS1, precDS1, recDS1, fsDS1]=alg04(basemaskIdDS1,masksDS1);
time_elpased_fsDS1=toc;

tic
[fscoreDS2, precDS2, recDS2, fsDS2]=alg04(basemaskIdDS2,masksDS2);
time_elpased_fsDS2=toc;
tic

%% 

tic
[fscore_ditsDS1, prec_ditsDS1, rec_ditsDS1, fs_ditsDS1]=alg05(basemaskIdDS1,masksDS1,basefingerDS1);
time_elpased_fs_ditsDS1=toc;


tic
[fscore_ditsDS2, prec_ditsDS2, rec_ditsDS2, fs_ditsDS2]=alg05(basemaskIdDS2,masksDS2,basefingerDS2);
time_elpased_fs_ditsDS2=toc;

tic
[fscore_ditsTestDS1, prec_ditsTestDS1, rec_ditsTestDS1, fs_ditsTestDS1]=alg05(basemaskIDtestDS1,masksTestDS1,basefingerDS1);
time_elpased_fs_ditsTestDS1=toc;

tic
[fscore_ditsTestDS2, prec_ditsTestDS2, rec_ditsTestDS2, fs_ditsTestDS2]=alg05(basemaskIDtestDS2,masksTestDS2,basefingerDS2);

time_elpased_fs_ditsTestDS2=toc;


%% 
cd(base)
save Prog01_16_17_Casas_Forcada