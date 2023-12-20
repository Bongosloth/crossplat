10 PRINT TAB(26);"BACRAT"
20 PRINT TAB(20);"CREATIVE COMPUTING"
30 PRINT TAB(18);"MORRISTOWN, NEW JERSEY":PRINT:PRINT:PRINT
40 PRINT"BACCARAT -- CHEMIN DE FER"
30 PRINT
60 PRINT"DO YOU NEED INSTRUCTIONS";
70 INPUT Q$
80 IF Q$<>"YES" THEN 210
    90 PRINT"    BACCARAT IS A VERY POPULAR GAME IN LAS"
    100 PRINT"VEGAS.  THE PLAYER AND BANKER EACH RECEIVE"
    110 PRINT"TWO CARDS FROM A 'SHOE' CONTAINING 8 DECKS"
    120 PRINT"OF CARDS.   ALL CARD COMBINATIONS TOTALING"
    130 PRINT"TEN ARE NOT COUNTED.  THE ONE THAT ENDS UP"
    140 PRINT"CLOSER TO NINE WINS.  THE STAKES ARE HIGH,"
    150 PRINT"ALL OF THE PLAYERS START WITH TEN THOUSAND"
    160 PRINT"DOLLARS.  YOU CAN BET ON THE DEALER OR THE"
    170 PRINT"PLAYER.   A THIRD CARD IS GIVEN ONLY UNDER"
    180 PRINT"CERTAIN CONDITIONS, AS YOU WILL SEE.   LET"
    190 PRINT"US BEGIN.      GOOD LUCK!"
    200 PRINT
210 DIM M(20),F1(20),F(20),B$(13),V(13),G$(20)
220 DIM Z(9,10),Q(4,13)
240 FOR X=3 TO 6
    250 FOR Y=1 TO 10
        260 READ Z(X,Y)
270 NEXT Y,X
280 FOR S1=1 TO 10:READ W(S1):NEXT
283 FOR S1=1 TO 4:READ A$(S1):NEXT
285 FOR S1=1 TO 13:READ B$(S1):NEXT
287 FOR S1=1 TO 13:READ V(S1):NEXT
290 PRINT
300 PRINT"HOW MANY PLAYERS";
310 INPUT P1
320 FOR J=1 TO P1
    330 PRINT"WHAT IS THE NAME OF PLAYER"J;
    340 INPUT G$(J)
    350 M(J)=10000
360 NEXT J
370 FOR S1=1 TO 4
    373 FOR S2=1 TO 13
        375 Q(S1,S2)=0
    377 NEXT S2
379 NEXT S1
380 FOR J=1 TO 6
    390 C=INT(1+RND(1)*4)
    400 D=INT(1+RND(1)*13)
    410 Q(C,D)=Q(C,D)+1
    420 IF Q(C,D)>=32 THEN 390
    430 B(J)=V(D)
    440 C$(J)=B$(D)+" OF "+A$(C)
450 NEXT J
460 W1=2
470 FOR J=1 TO P1
    480 IF M(J)<1 THEN 380
    490 PRINT G$(J)" HAS $"M(J)".   BET";
    500 INPUT F(J)
    510 IF F(J)>M(J) THEN 490
    520 IF F(J)<>INT(F(J)) THEN 490
    530 IF F(J)<1 THEN 490
    540 PRINT"(1) BANKER OR (2) PLAYER";
    550 INPUT F1(J)
    560 IF F1(J)>=1000 THEN 490
    570 IF (F1(J)-1)*(F1(J)-2)<>0 THEN 540
580 NEXT J
590 J=0
600 T1=B(1)+B(2)
610 T2=B(3)+B(4)
620 PRINT
630 PRINT"BANKER"TAB(20)"PLAYER"
640 PRINT C$(3)TAB(20)C$(1)
650 PRINT C$(4)TAB(20)C$(2)
660 IF T1<10 THEN 680
670 T1=T1-10
680 IF T2<10 THEN 700
690 T2=T2-10
700 IF W(T1+1)=0 THEN 770
710 PRINT"PLAYER MUST DRAW."
720 PRINT C$(5)
730 T1=T1+B(5)
740 IF T1<10 THEN 770
750 T1=T1-10
760 GOTO 790
770 PRINT"PLAYER CANNOT DRAW."
780 J=11
790 PRINT"PLAYERS TOTAL:"T1
800 PRINT
810 IF T2<3 THEN 870
820 IF T2>6 THEN 930
830 IF J<>11 THEN 860
840 IF T2=6 THEN 930
850 GOTO 870
860 IF Z(T2,B(5)+1)=0 THEN 930
870 PRINT"BANKER MUST DRAW."
880 PRINT C$(6)
890 T2=T2+B(6)
900 IF T2<10 THEN 920
910 T2=T2-10
920 GOTO 940
930 PRINT"BANKER CANNOT DRAW."
940 PRINT"BANKERS TOTAL:"T2
950 PRINT
960 IF T2<>T1 THEN 990
970 PRINT"IT'S A TIE.  THE HAND IS PLAYED OVER."
980 GOTO 380
990 IF T2<T1 THEN 1030
1000 W1=1
1010 PRINT"BANKER WINS!!"
1020 GOTO 1040
1030 PRINT"PLAYER WINS!!"
1040 FOR J=1 TO P1
    1050 IF M(J)<=0 THEN 1130
    1060 PRINT G$(J)" ";
    1070 IF F1(J)=W1 THEN 1110
    1080 M(J)=M(J)-F(J)
    1090 PRINT"LOSES $"F(J)", FOR A TOTAL OF $"M(J)"."
    1100 GOTO 1130
    1110 M(J)=M(J)+F(J)
    1120 PRINT"WINS $"F(J)", FOR A TOTAL OF $"M(J)"."
    1130 NEXT J
    1140 FOR J=1 TO P1
    1150 IF M(J)<>0 THEN 1190
1160 NEXT J
1170 PRINT"THANK YOU FOR YOUR MONEY, AND ";
1180 GOTO 1320
1190 PRINT
1200 PRINT"---------- NEW GAME ----------"
1210 PRINT
1220 FOR X=1 TO 4
1230 FOR Y=1 TO 13
1240 IF Q(X,Y)<>8 THEN 380
1250 NEXT Y,X
1260 GOTO 370
1270 DATA 1,1,1,1,1,1,1,1,0,1,0,0,1,1,1,1,1,1,0,0
1280 DATA 0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0
1290 DATA 1,1,1,1,1,1,0,0,0,0,SPADES,HEARTS,DIAMONDS
1300 DATA CLUBS,ACE,TWO,THREE,FOUR,FIVE,SIX,SEVEN,EIGHT
1310 DATA NINE,TEN,JACK,QUEEN,KING,1,2,3,4,5,6,7,8,9,0,0,0,0
1320 PRINT"THANK YOU FOR PLAYING."
1330 END
