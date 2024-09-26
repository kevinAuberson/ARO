ADR_debut_prog:
mov r0, #5 @ charge 5 dans r0
mov r1, #2 @ charge 2 dans r1
add r2, r0, r1 @ r0 + r1 , resultat dans r2
add r3, r2, #4 @ r2 + 4 , resultat dans r3
B ADR_saut_1 @ Saut inconditionnel jusqu ’a ADR_saut_1
.org 0x40
ADR_saut_1 :
mov r2, #6 @ charge 6 dans r2
sub r3, r2, #1 @ r2 − 1 , resultat dans r3
cmp r3, #0
beq ADR_saut_2 @ saut conditionnel si egal zero jusqu’ a ADR_saut_2 (condition s i Z = ’1’)
.org 0x60
ADR_saut_2 :
mov r0, #4 @ Charge 4 dans r0
mov r1, #128 @ Charge 128 dans r1
B ADR_debut_prog @ Saut inconditionnel jusqu’ a ADR_debut_prog




