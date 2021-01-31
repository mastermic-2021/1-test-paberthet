str2ascii(s)=Vec(Vecsmall(s));
ascii2str(v)=Strchr(v);
encode(s) = {
[ if(c==32,0,c-96) | c <- str2ascii(s), c == 32 || 97 <= c && c <=122 ];
}
decode(v) = {
ascii2str([ if(c ==0,32,c+96) | c <- v]);
}

text = readstr("input.txt")[1];
k = encode("haricot");
chiffre = encode(text);

decrypt(ch,cf)={
for(i=1,#ch,ch[i] =(27 + ch[i]-cf[(i-1)%(#cf)+1])%27);
return (ch);
}

clair = decrypt(chiffre,k);
clair = decode(clair);
print(clair);