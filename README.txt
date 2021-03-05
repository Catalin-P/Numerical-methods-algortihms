Picior Catalin 312CB
Task 1

Pt a genera sistemul de ecuatii de folosim de o functie aux triangle_to_square care transforma coordonatele unei matrici din forma din enunt intr-una obisnuita.

Functia de generare a sistemului verifica mai multe posibilitati, pe baza unor conditii:
daca elem din matrice este coltul de sus(p1), daca este un colt, daca face parte de pe ultima linie, respectiv daca este pe margini.

Matrix_to_csr contine algoritmul de "segmentare" al matricei in vectorii doriti.

Jacobi_factorization se ocupa de algoritmul de factorizare intr-o maniera clasica.

Jacobi sparse se foloseste, de asemenea, de functiile mentionate anterior pentru a rezolva sistemul de ecuatii dat sub forma de matrice rara.

Task 2

Functia aditionala closestCentroid verifica cei mai apropiat centroid de un pct dat, calculand dist euclidiana min dintre un punct si toti centroizii

Functia de clustering asociaza fiecare pct unui centroid cu ajutorul fct de mai sus, si recalculeaza toti centroizii pana poz lor nu se modifica.

Functia compute_cost_pc calculeaza suma minima a dist de la pct la centroizi.

Task 3

Pt a crea histogramele pt hsv si rgb am folosit fct aditionala Histogram: pt RGB, un param devine 256, respectiv 1.01 pt HSV. Codul este relativ vectorizat, folosindu se accumarray pentru binning.

Functia RGB2HSV contine algoritmul dat in enuntul temei, dar vectorizat la maxim, cu conditii logice in loc de instructiuni de decizie.
 SST si Householder sunt algoritmii abordati clasic, insa SST este modifica pt a rula pe matrici nu neaparat patratice, folosindu se min dintre linii si coloane pt rezolvarea sistemului.

Functia learn imparte sistemul de rezolvat in doua sisteme mai eficient de reolvat, evitand astfel calculul inversei mat X.

Fct preprocess prelucreaza toate imaginile de antrenament si avem un vector de vectori de feature-uri carora le asociam etichete si cu care antrenam modelul matematic w.
 Fct evaluate evalueaza daca vectorul de feature-uri al fiecarei imagini inmultit cu w prezice continutul unei imagini. daca w*feature<=0 este pisica, altfel nu este pisica.

Task 4
 Am folosit functiile de la task 3, iar in functia de learn am aplicat algoritmul din enuntul temei. De asemenea, am modificat functia evaluate pt a prelucra intreaga matrice X.

