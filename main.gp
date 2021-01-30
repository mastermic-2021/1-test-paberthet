str2ascii(s)=Vec(Vecsmall(s));
ascii2str(v)=strchr(v);
encode(s) = {
  [ if(c==32,0,c-96) | c <- str2ascii(s), c==32 || 97<=c && c<= 122 ];
}
decode(v) = {
  ascii2str([ if(c==0,32,c+96) | c <- v]);
}
text=readstr("input.txt")[1];
k=encode("haricot");
c = encode(text);

decrypt(chiffre, clef, clair) = {
for(i=1,#chiffre,concat(clair,(Mod(chiffre[i]-clef[Mod(i-1,#clef)+1],26))))
}

clair = [];
clair=decrypt(c,k,clair);
clair = decode(clair);
print(clair);


\\ resoudre l'exercice, bien mettre des ; a la fin des lignes

\\ a la fin, faire simplement
\\ print(clair);
