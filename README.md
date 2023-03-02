#Rosu Mihai Cosmin 313CA

Detalii implementare:
-In cadrul implementarii temei m-am folosit de PDF-ul pus la dispozitie.
-In mare parte am urmat TODO-urile lasate in cod
-De mai multe ori am remarcat ca x-ul parcurge liniile, iar y-ul coloanele,
ceea ce a dus la mici schimbari fata de PDF-ul pus la dispozitie.

Nearest Neighbour:
-In rezolvarea interpolarii nearest neighbour singurele diferente au fost la
aplicarea transformarii inverse pentru a determina pozitia punctului in
imaginea originala.
-Diferenta consta in faptul ca x_p-ul era de fapt al doilea element din
vectorul rezultat, iar y_p-ul este primul. Acest fapt se datoreaza faptului
ca in imaginea initiala x-ul parcurgea liniile si y-ul coloanele, iar in
imaginea ce trebuie formata sunt invers: y pe linii si x pe coloane.

Bilinear:
-Pentru calcularea coeficientilor, unde era necesara rezolvarea unui sistem de
ecuatii liniare, am folosit factorizarea QR, cu metoda Householder, urmata de
un backwards substitution.
-La calculul valorii pixelului formula era putin diferita de cea din PDF tot
din cauza diferentei de parcurgere a x-ului si y-ului.
-Pentru resize si rotate au fost aceleasi diferente ca la nearest neighbour si
in plus, la apelul functiei de calcul al coeficientilor biliniari, y1 este
inversat cu x1 si y2 cu x2, din aceeasi cauza.
-De asemenea la functia surrounding points la verificarea daca x-ul sau y-ul
este la final, am schimbat m-ul si n-ul intre ele, pentru a corespunde cu modul
in care x-ul si y-ul parcurg liniile, respectiv coloanele.

Bicubic:
-Pentru precalcularea derivatelor, Ix folosea formula pentru f_y, iar Iy pe cea
pentru f_x.
-De asemenea, deoarece Ix-ul era interschimbat cu Iy-ul, le-am schimbat
pozitiile si in formula pentru determinarea coeficientilor, fiind necesar sa
transpun matricea in cele din urma.
-In rest, la resize aceleasi diferente ca la interpolarile precedente.