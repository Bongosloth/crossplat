import random

def is_web():
    return "__BRYTHON__" in globals()

def write(message, end='\n'):
    if is_web():
        from browser import document
        console = document.getElementById('console')
        p = document.createElement('p')
        p.textContent = '> ' + message
        console.appendChild(p)
        console.scrollTop = console.scrollHeight
    else:
        print(message, end=end)


async def read():
    if is_web():
        from browser import document, aio
        inp = document.getElementById('input')
        while True:
            event = await aio.event(inp, 'keydown')
            if event.key == 'Enter':
                tmp = event.target.value
                event.target.value = ''
                write(tmp)
                return tmp
    else:
        return input()


def run(function):
    if is_web():
        from browser import aio
        aio.run(function())
    else:
        import asyncio
        asyncio.run(function())

async def main():
    write('BACRAT'.center(26))
    write("CREATIVE COMPUTING".center(20))
    write("MORRISTOWN, NEW JERSEY".center(18))
    write("\n\n\n")
    write("BACCARAT -- CHEMIN DE FER")
    write("\n")
    write("DO YOU NEED INSTRUCTIONS")
    q = await read()
    if q == "YES":
        write("    BACCARAT IS A VERY POPULAR GAME IN LAS")
        write("VEGAS.  THE PLAYER AND BANKER EACH RECEIVE")
        write("TWO CARDS FROM A 'SHOE' CONTAINING 8 DECKS")
        write("OF CARDS.   ALL CARD COMBINATIONS TOTALING")
        write("TEN ARE NOT COUNTED.  THE ONE THAT ENDS UP")
        write("CLOSER TO NINE WINS.  THE STAKES ARE HIGH,")
        write("ALL OF THE PLAYERS START WITH TEN THOUSAND")
        write("DOLLARS.  YOU CAN BET ON THE DEALER OR THE")
        write("PLAYER.   A THIRD CARD IS GIVEN ONLY UNDER")
        write("CERTAIN CONDITIONS, AS YOU WILL SEE.   LET")
        write("US BEGIN.      GOOD LUCK!")
        write()

    M = [0]*21
    F1 = [0]*21
    F = [0]*21
    B = [""]*14
    V = [0]*14
    G = [""]*21
    Z = [[0]*11 for _ in range(10)]
    Q = [[0]*14 for _ in range(5)]

    for x in range(3, 7):
        for y in range(1, 11):
            Z[x][y] = [x, y]

    W = [0]*111
    A = [""]*51
    B = [""]*141
    V = [0]*141

    data1 = [1,1,1,1,1,1,1,1,0,1,0,0,1,1,1,1,1,1,0,0]
    data2 = [0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,0,0]
    data3 = [1,1,1,1,1,1,0,0,0,0,"SPADES","HEARTS","DIAMONDS"]
    data4 = ["CLUBS","ACE","TWO","THREE","FOUR","FIVE","SIX","SEVEN","EIGHT"]
    data5 = ["NINE","TEN","JACK","QUEEN","KING",1,2,3,4,5,6,7,8,9,0,0,0,0]

    for i in range(1, 11):
        W[i] = i
    for i in range(len(data3)):
        A[i] = str(data3[i])
    for i in range(len(data4)):
        B[i] = str(data4[i])
    for i in range(1, 14):
        V[i] = i

    write("\n")
    write("HOW MANY PLAYERS?")
    P1 = await read()
    P1 = int(P1)
    for j in range(1, P1+1):
        write("WHAT IS THE NAME OF PLAYER " + str(j))
        G[j] = await read()
        M[j] = 10000

    while True:
        for s1 in range(1, 5):
            for s2 in range(1, 14):
                Q[s1][s2] = 0

        C = [0]*14
        for j in range(1, 7):
            while True:
                Ci = random.randint(1, 4)
                D = random.randint(1, 13)
                Q[Ci][D] += 1
                if Q[Ci][D] < 32:
                    break
            B[j] = V[D]
            C[j] = str(B[D]) + " OF " + str(A[Ci])

        W1 = 2
        for j in range(1, P1+1):
            if M[j] < 1:
                continue
            while True:
                write(str(G[j]) + " HAS $" + str(M[j]) + " BET")
                F[j] = await read()
                F[j] = int(F[j])
                if F[j] > M[j] or F[j] != int(F[j]) or F[j] < 1:
                    continue
                while True:
                    write("(1) BANKER OR (2) PLAYER")
                    F1[j] = await read()
                    F1[j] = int(F1[j])
                    if F1[j] < 1000 and (F1[j] - 1) * (F1[j] - 2) == 0:
                        break
                break

        j = 0
        T1 = B[1] + B[2]
        T2 = B[3] + B[4]
        write("\n")
        write("BANKER" + " "*20 + "PLAYER")
        write(C[3] + " "*20 + C[1])
        write(C[4] + " "*20 + C[2])
        if int(T1) >= 10:
            T1 -= 10
        if int(T2) >= 10:
            T2 -= 10
        if W[T1+1] != 0:
            write("PLAYER MUST DRAW.")
            write(C[5])
            T1 += B[5]
            if T1 >= 10:
                T1 -= 10
        else:
            write("PLAYER CANNOT DRAW.")
            j = 11
        write("PLAYERS TOTAL: " + str(T1) + "\n")
        if T2 < 3 or (j == 11 and T2 != 6) or Z[T2][B[5]+1] != 0:
            write("BANKER MUST DRAW.")
            write(C[6])
            T2 += B[6]
            if T2 >= 10:
                T2 -= 10
        else:
            write("BANKER CANNOT DRAW.")
        write("BANKERS TOTAL: " + str(T2) + "\n")
        if T2 == T1:
            write("IT'S A TIE. THE HAND IS PLAYED OVER.")
            continue
        if T2 < T1:
            write("PLAYER WINS!!")
        else:
            W1 = 1
            write("BANKER WINS!!")
        for j in range(1, P1+1):
            if M[j] <= 0:
                continue
            write(G[j], end="")
            if F1[j] == W1:
                M[j] += F[j]
                write("WINS $" + str(F[j]) + ", FOR A TOTAL OF $" + str(M[j]) + ".")
            else:
                M[j] -= F[j]
                write("LOSES $" + str(F[j]) + ", FOR A TOTAL OF $" + str(M[j]) + ".")
        for j in range(1, P1+1):
            if M[j] != 0:
                break
        write("\n")
        write("---------- NEW GAME ----------")
        write("\n")
        for x in range(1, 5):
            for y in range(1, 14):
                if Q[x][y] != 8:
                    break
            else:
                continue
            break
        else:
            break
    write("THANK YOU FOR PLAYING.")


run(main)