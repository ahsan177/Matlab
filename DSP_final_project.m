file=dir('E:\softwares\Matlab_Projects\Signals/*.mat');
l1=length(file);
Data1=[];
for i=1:1:l1
    sig=load(['E:\softwares\Matlab_Projects\Signals/',file(i).name]);
    
 l=length(sig.val);
Fsig=medfilt1(sig.val,(l/5)*0.2);
Fsig2=medfilt1(Fsig,(l/5)*0.6);
res=sig.val-Fsig2;
% figure;
% plot(res);
fresult = fft(res);
fresult(1,:);
[c,l]=wavedec(sig.val,4,'db4');

ca1=appcoef(c,l,'db4',1);
ca2=appcoef(c,l,'db4',2);
ca3=appcoef(c,l,'db4',3);
ca4=appcoef(c,l,'db4',4);

m1=max((ca3)*0.6);
P=find(ca3>=m1);
% disp(m1);
P1=P; 
P2=[]; 
last=P1(1);
P2=[P2 last];

for i=2:1:length(P1)

    if(P1(i)>(last+10))
        last=P1(i);
        P2=[P2 last];
    end
end
P3=P2*4;
Rloc=[];
A=4;
for i=1:1:length(P3)

  range=(P3(i)-20:P3(i)+20);
    m=max(A*(range));
    l=find(A*(range)==m);
    pos=range(l);
    Rloc=[Rloc pos];

end
Ramp=A*(Rloc);
X=Rloc;
y1=A;

for i=1:1:1 
for j=1:1:length(X)                            %%P Peaks
a=Rloc(i,j)-100:Rloc(i,j)-10;
    m=max(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Ploc(i,j)=b;
    Pamp(i,j)=m;

    a=Rloc(i,j)-50:Rloc(i,j)-10;                 %% Q Peaks
    m=min(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Qloc(i,j)=b;
    Qamp(i,j)=m;

    a=Rloc(i,j)+5:Rloc(i,j)+50;                %% S Peaks
    m=min(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Sloc(i,j)=b;
    Samp(i,j)=m;
end
end

Qamp=mean(Qamp);
Ramp=mean(Ramp);
Samp=mean(Samp);
Feature1=[Qamp,Ramp,Samp];
label1=[1;1;1;1;1;1;1;1;1;1];
Data1=[Data1;Feature1];

end
Data2=[];
file=dir('E:\softwares\Matlab_Projects\Apnea-Signal/*.mat');
l2=length(file);
for i=1:1:l2
    sig=load(['E:\softwares\Matlab_Projects\Apnea-Signal/',file(i).name]);
    
 l3=length(sig.val);
Fsig=medfilt1(sig.val,(l3/5)*0.2);
Fsig2=medfilt1(Fsig,(l3/5)*0.6);
res=sig.val-Fsig2;
% figure;
% plot(res);
fresult = fft(res);
fresult(1,:);
[c,l]=wavedec(sig.val,4,'db4');

ca1=appcoef(c,l,'db4',1);
ca2=appcoef(c,l,'db4',2);
ca3=appcoef(c,l,'db4',3);
ca4=appcoef(c,l,'db4',4);

m1=max((ca3)*0.6);
P=find(ca3>=m1);
% disp(m1);
P1=P; 
P2=[]; 
last=P1(1);
P2=[P2 last];

for i=2:1:length(P1)

    if(P1(i)>(last+10))
        last=P1(i);
        P2=[P2 last];
    end
end
P3=P2*4;
Rloc1=[];
A=4;
for i=1:1:length(P3)

  range=(P3(i)-20:P3(i)+20);
    m=max(A*(range));
    l=find(A*(range)==m);
    pos=range(l);
    Rloc1=[Rloc1 pos];

end
Ramp1=A*(Rloc1);
X=Rloc1;
y1=A;

for i=1:1:1 
for j=1:1:length(X)                            %%P Peaks
a=Rloc1(i,j)-100:Rloc1(i,j)-10;
    m=max(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Ploc1(i,j)=b;
    Pamp1(i,j)=m;

    a=Rloc1(i,j)-50:Rloc1(i,j)-10;                 %% Q Peaks
    m=min(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Qloc1(i,j)=b;
    Qamp1(i,j)=m;

    a=Rloc1(i,j)+5:Rloc1(i,j)+50;                %% S Peaks
    m=min(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Sloc1(i,j)=b;
    Samp1(i,j)=m;
end
end
Qamp1=mean(Qamp1);
Ramp1=mean(Ramp1);
Samp1=mean(Samp1);
Feature2=[Qamp1,Ramp1,Samp1];
label2=[2;2;2;2;2;2;2;2;2;2];
Data2=[Data2;Feature2];
end
label=[label1;label2];
Data=[Data1;Data2];
Data3=[];
file=dir('E:\softwares\Matlab_Projects\Test-Signal/*.mat');
l1=length(file);
for i=1:1:l1
    sig=load(['E:\softwares\Matlab_Projects\Test-Signal/',file(i).name]);
    
 l=length(sig.val);
Fsig=medfilt1(sig.val,(l/5)*0.2);
Fsig2=medfilt1(Fsig,(l/5)*0.6);
res=sig.val-Fsig2;
% figure;
% plot(res);
fresult = fft(res);
fresult(1,:);
[c,l]=wavedec(sig.val,4,'db4');

ca1=appcoef(c,l,'db4',1);
ca2=appcoef(c,l,'db4',2);
ca3=appcoef(c,l,'db4',3);
ca4=appcoef(c,l,'db4',4);

m1=max((ca3)*0.6);
P=find(ca3>=m1);
% disp(m1);
P1=P; 
P2=[]; 
last=P1(1);
P2=[P2 last];

for i=2:1:length(P1)

    if(P1(i)>(last+10))
        last=P1(i);
        P2=[P2 last];
    end
end
P3=P2*4;
Rloc2=[];
A=4;
for i=1:1:length(P3)

  range=(P3(i)-20:P3(i)+20);
    m=max(A*(range));
    l=find(A*(range)==m);
    pos=range(l);
    Rloc2=[Rloc2 pos];

end
Ramp2=A*(Rloc2);
X=Rloc2;
y1=A;

for i=1:1:1 
for j=1:1:length(X)                            %%P Peaks
a=Rloc2(i,j)-100:Rloc2(i,j)-10;
    m=max(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Ploc2(i,j)=b;
    Pamp2(i,j)=m;

    a=Rloc2(i,j)-50:Rloc2(i,j)-10;                 %% Q Peaks
    m=min(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Qloc2(i,j)=b;
    Qamp2(i,j)=m;

    a=Rloc2(i,j)+5:Rloc2(i,j)+50;                %% S Peaks
    m=min(y1*(a));
    b=find(y1*(a)==m);
    b=b(1);
    b=a(b);
    Sloc2(i,j)=b;
    Samp2(i,j)=m;
end
end

Qamp2=mean(Qamp2);
Ramp2=mean(Ramp2);
Samp2=mean(Samp2);
Feature3=[Qamp2,Ramp2,Samp2];
Data3=[Data3;Feature3];

end
% 
scatter(Data1(:,1),Data1(:,2),'r');    %%ECG-Signal
hold on
scatter(Data2(:,1),Data2(:,2),'b');    %%Apnea-Signal
hold on
scatter(Data3(:,1),Data3(:,2),'g');    %%Testing-Signal

disp('Class 1 is Normal Ecg:')
disp('Class 2 is Apnea:')
CLASS = knnclassify(Data3,Data,label);
disp('Classes are:')
disp(CLASS)
