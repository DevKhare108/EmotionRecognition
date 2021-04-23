b=zeros(480,7);
for i=1:480
    b(i,CodeBook_L(i))=1;
end
X=pinv(CodeBook_data')*b;
tra=CodeBook_data'*X;
for i=1:size(tra,1)
  L(i)=find(tra(i,:)==max(tra(i,:)));
end 