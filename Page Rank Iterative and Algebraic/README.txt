Picior Catalin 312CB

Am creat functia ParseFile pentru a citi graful dat si a prelucra direct matricea M, fara a mai fi nevoie de matricele A si K. In timpul citirii fisierului de intrare am efectuat verificari pentru a elimina linkurile care duceau spre aceeasi pagina.

In fisierul Iterative.m am intializat vectorul R cu valorile recomandate(1/nr. de varfuri din graf).Iteram pana obtinem rezulatatul dorit folosind formula data(adica pana cand eroarea este suficient de mica), si retinem mereu iteratia precedenta(pentru a putea afisa valorea R(t), nu R(t+1)).

In fiserul Algebraic.m initalizam din nou vectorul R ca in Iterative.m, apoi rezolvam inversa din ecuatie cu descompunerea QR cu alg Cram Schmidt de la curs, apoi rezolvam cu SST(algoritm implementat in tema1) cele N(dim matricei M) siteme de ecuatii rezultate. Dupa calculul inversei, folosim formula din enunt pentru a calcula algerbric vectorul R.

In PageRank.m folosim rezultatele obtinute iterativ(R1) si algebric(R2), apoi sortam vectorul R2 descrescator. Completam conditiile de continuitate in fisierul Apartenent.m, si aflam valoarea u(x). In continuare, calculam coeficientul fiecarei pagini din vectorul sortat (se scriu pagina curenta si nr. de linkuri catre pagina in fisier). Se scriu toate datele in fisierul graf[].out. 


