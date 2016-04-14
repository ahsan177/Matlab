im=imread('cameraman.tif');
figure
imshow(im)
im=imresize(im,[64,64]);
for i=1:8
    quality(1:i,i)=2^(i-1);
    quality(i,1:i)=2^(i-1);         
end


[r,c]=size(im);
DCTM=dct(eye(8));                                     
iDCTM=DCTM.';                                         
image1=zeros(r,c);
for i=1:8:r
    for j=1:8:c
        chunk=double(im(i:i+8-1,j:j+8-1));

        final=chunk*DCTM;
        final1=final*iDCTM;
        final2=final1./quality;                         
        image1(i:i+8-1,j:j+8-1)=final2;
       
    end
end
y=zigzag(image1);
y1=y.';
       
DPCM(1)=y1(1);
for i=2:length(y1)
    DPCM(i)=y1(i)-y1(i-1);
end

%RLE

RLE1=RLEncoding(DPCM); 


%Huffman encoding
RLE=num2str(RLE1);
y3=unique(RLE);                                               
 k=0;  
 for i=1:length(y3)           
     for j=1:length(RLE)
         if y3(i)==RLE(j);                                   
             k=k+1;
         end
     end
     z(i)=k;
     k=0;
 end
z=z./sum(z);                                                 
in1=num2cell(y3);
 
code_dict=huffmandict(in1,z);
huffman_code=huffmanenco(RLE,code_dict);    

%Decode
Huffman_DEcode=huffmandeco(huffman_code,code_dict);  
Huffman_DEcode=cellfun(@num2str,Huffman_DEcode);


Huffman_DEcode=str2num(Huffman_DEcode);
RLDecode=[];
for i=1:2:length(Huffman_DEcode)-1
    for j=1:Huffman_DEcode(i+1)                    
        rldecode(j)= Huffman_DEcode(i);
    end
     RLDecode=[RLDecode,rldecode];
     rldecode=[];
end


DPCMdecode(1)=RLDecode(1);
for i=2:length(RLDecode)
    DPCMdecode(i)=DPCMdecode(i-1)+RLDecode(i);
end

output=izigzag(double(DPCMdecode), 64, 64);
output=output';


[r,c]=size(output);
image=zeros(r,c);
DCTM=dct(eye(8));                                    
iDCTM=DCTM.';                                         
for i=1:8:r
    for j=1:8:c
        chunk1=output(i:i+8-1,j:j+8-1);
        chunk2=chunk1.*quality;

         f1=chunk2*iDCTM;
         f1=f1*DCTM;
        image(i:i+8-1,j:j+8-1)=f1;  
    end
end
figure
imshow(uint8(image));