# Circuit data_hazard
> [!Question 1]
> A quoi sert le signal sel_mem_i?

Il permet de savoir si l'instruction en cours est une instruction de mémoire

> [!Question 2]
> Est-il possible/utile de faire un data forwarding depuis le stage WRITE_BACK ? (l’écriture dans le registre dans la banque de registres). Comment pourrait-il être ajouté au circuit?

Une fois le WRITE_BACK fini, toutes les informations sont disponibles et de ce fait le forwarding n'a pas d'utilité

>[!Question 3]
>Quelles sont les conditions pour que le forwarding puisse avoir lieu? Quelles sont les conditions pour que le forwarding soit utile?

Il faut que les valeurs des registres de l'instruction n à la sortie de l'EXECUTE soient accessibles au début de l'EXECUTE de l'instruction n+1

>[!Question 4]
>Quelles sont les conséquences du forwarding sur la gestion des aléas de données?

On réduit le temps des aléas de données

# Circuit execute
>[!Question 1]
>Pourquoi doit-on faire ça?

Il est nécessaire de récupérer les valeurs à la sortie de l'EXECUTE de l'instruction précédente pour pouvoir entrer dans l'EXECUTE actuel 

>[!Question 2]
>Pourquoi doit-on faire ça pour le signal reg_mem_data_s?



>[!Question 3]
>Que devrait-on faire si on avait un data forwarding venant du WRITE_BACK?


# Test : pipeline forwarding
**code utilisé pour le test**
``` THUMB
MOV r0, #0
MOV r1, #1
MOV r2, #2
LSL r3, r2, #4
MOV r1, #0
MOV r2, #1
MOV r3, #2
ADD r4, r2, r3
ADD r1, r3, r2
STRH r4, [r1, #4] 
MOV r2, #5
MOV r1, #3
MOV r3, #8
MOV r0, #1
AND r2, r3
ROR r1, r4
STRH r2, [r0, #4]
```

>[!Question 1]
>Est-ce que votre processeur fonctionne correctement? Est-ce que les timings sont respectés? Est-ce que les registres contiennent les bonnes valeurs si on regarde étape par étape l’exécution des instructions?

Oui, le processeur fonctionne correctement. Le timings sont respectés et correspondent aux 4 premières étapes de la première instruction et un cycle par instruction supplémentaire. Toutes les valeurs sont correctes au départ, pendant et après le processus.
>[!Question 2]
>Quel est l’IPC de votre programme? et le throughput si on considère une clock à 4KHz?

IPC = 1 / 0.00032
Débit  = m / (n + m - 1) * Te = 0.000032 
Te = 25000 ns

>[!Question 3]
>Avez-vous d’autres idées d’optimisation de ce processeur?
Un affichage des données à chaque étape

