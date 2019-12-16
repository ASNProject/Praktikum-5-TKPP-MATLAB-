for i = 1:4
    data1{i} = imread(['C:\Users\ARIEF SETYO NUGROHO\Desktop\DATA PRAKTIKUM\ahodki\' num2str(i) '.jpg']);
    data2{i} = imread(['C:\Users\ARIEF SETYO NUGROHO\Desktop\DATA PRAKTIKUM\ambarw\' num2str(i) '.jpg']);
    data3{i} = imread(['C:\Users\ARIEF SETYO NUGROHO\Desktop\DATA PRAKTIKUM\astefa\' num2str(i) '.jpg']);
    data4{i} = imread(['C:\Users\ARIEF SETYO NUGROHO\Desktop\DATA PRAKTIKUM\cshubb\' num2str(i) '.jpg']);
    data5{i} = imread(['C:\Users\ARIEF SETYO NUGROHO\Desktop\DATA PRAKTIKUM\ekavaz\' num2str(i) '.jpg']);
end;

% Pemrosesan awal dan ekstraksi ciri
for i = 1:4    
    data1{i} = rgb2gray(data1{i});
    data1{i} = imresize(data1{i},[30 20]);
    x1{i}=reshape(data1{i},[600,1]);
    x1{i}=x1{i}-mean(x1{i});
    data2{i} = rgb2gray(data2{i});
    data2{i} = imresize(data2{i},[30 20]);
    x2{i}=reshape(data2{i},[600,1]);
    x2{i}=x2{i}-mean(x2{i});
    data3{i} = rgb2gray(data3{i});
    data3{i} = imresize(data3{i},[30 20]);
    x3{i}=reshape(data3{i},[600,1]);
    x3{i}=x3{i}-mean(x3{i});
    data4{i} = rgb2gray(data4{i});
    data4{i} = imresize(data4{i},[30 20]);
    x4{i}=reshape(data4{i},[600,1]);
    x4{i}=x4{i}-mean(x4{i});
    data5{i} = rgb2gray(data5{i});
    data5{i} = imresize(data5{i},[30 20]);
    x5{i}=reshape(data5{i},[600,1]);
    x5{i}=x5{i}-mean(x5{i});
end;

% Template 5 wajah ('training mode')    
p1=mean([x1{1} x1{2} x1{3} x1{4}],2);
p2=mean([x2{1} x2{2} x2{3} x2{4}],2);
p3=mean([x3{1} x3{2} x3{3} x3{4}],2);
p4=mean([x4{1} x4{2} x4{3} x4{4}],2);
p5=mean([x5{1} x5{2} x5{3} x5{4}],2);

%'testing mode' 
I=imread(['C:\Users\ARIEF SETYO NUGROHO\Desktop\DATA PRAKTIKUM\ahodki\5.jpg']);
I=rgb2gray(I);
x= imresize(I,[30 20]);
x=reshape(x,[600,1]);
px=double(x-mean(x));

d1=dmanhattan(px,p1);  
d2=dmanhattan(px,p2);  
d3=dmanhattan(px,p3);  
d4=dmanhattan(px,p4); 
d5=dmanhattan(px,p5); 

%Pengambilan keputusan hasil pengenalan
minimum=min([d1 d2 d3 d4 d5]); 
if (d1==minimum)
    class='Mirip ahodki'
    elseif (d2==minimum)
        class='Mirip ambarw'
        elseif (d3==minimum)
            class='Mirip astefa'
            elseif (d4==minimum)
                class='Mirip cshubb'
                else (d5==minimum)
                class='Mirip ekavaz'
end
