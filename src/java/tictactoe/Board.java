package tictactoe;

import java.util.Random;

public class Board {

    public static final int A = 9;

    public static final int EMPTY = 2;
    public static final int X = 3;
    public static final int O = 5;

    public static final int CHECKVALUEX = 18;//X*X*EMPTY
    public static final int CHECKVALUEO = 50;//O*O*EMPTY

    public static final int ST_EMPTY = -1;
    public static final int ST_DRAW = 0;
    public static final int ST_PLAYER = 1;
    public static final int ST_COMPUTER = 2;

    private int[] matrix;
    private int currentPlayer = X;
    private int player;
    private int computer;
    private int winner;
    private char c[] = {'X', 'O', ' '};
//    private int turn;

    public Board(int player) {
        this();
        this.currentPlayer = player;
    }

    public Board() {
        matrix = new int[A];
//        turn = 0;
        winner = ST_EMPTY;
        initializeMatrix();
    }

    public void initializeMatrix() {
        for (int i = 0; i < A; i++) {
            matrix[i] = EMPTY;
        }
    }

    public void resetGame() {
        initializeMatrix();
        this.setCurrentPlayer(EMPTY);
        this.setWinner(ST_EMPTY);
    }
//
//    public void checkDraw(){
//        if(winner==ST_EMPTY){
//            boolean check=true;
//            for(int i: matrix){
//                if(i==EMPTY){
//                    check=false;
//                }
//            }
//            if(check){
//                winner=ST_DRAW;
//            }
//        }
//    }
    
    public int checkMove(int player) {
        int check = 0;
        int i;

        if (player == X) {
            check = CHECKVALUEX;
        } else if (player == O) {
            check = CHECKVALUEO;
        }

        //hang
        i = 0;
        while (i < A) {
            if (matrix[i] * matrix[i + 1] * matrix[i + 2] == check) {
                if (matrix[i] == EMPTY) {
                    return i;
                } else if (matrix[i + 1] == EMPTY) {
                    return i + 1;
                } else {
                    return i + 2;
                }
            }
            i += 3;
        }
        //cot
        i = 0;
        while (i < 3) {
            if (matrix[i] * matrix[i + 3] * matrix[i + 6] == check) {
                if (matrix[i] == EMPTY) {
                    return i;
                } else if (matrix[i + 3] == EMPTY) {
                    return i + 3;
                } else {
                    return i + 6;
                }
            }
            i++;
        }
        //cheo
        if (matrix[0] * matrix[4] * matrix[8] == check) {
            if (matrix[0] == EMPTY) {
                return 0;
            } else if (matrix[4] == EMPTY) {
                return 4;
            } else {
                return 8;
            }
        }
        if (matrix[2] * matrix[4] * matrix[6] == check) {
            if (matrix[2] == EMPTY) {
                return 2;
            } else if (matrix[4] == EMPTY) {
                return 4;
            } else {
                return 6;
            }
        }
        return -1;
    }

    public int createRandomMove() {
        Random rand = new Random();
        int i;
        do {
            i = rand.nextInt(A);
            if (matrix[i] == EMPTY) {
                return i;
            }
        } while (true);
    }

    public int createOptimalMove() {
        int i = checkMove(this.computer);
        int j = checkMove(this.player);
        //di nuoc de may thang
        if (i != -1) {
            winner = ST_COMPUTER;
            return i;
            //di nuoc chan nguoi choi
        } else if (j != -1) {
            return j;
            //di random
        } else {
            return createRandomMove();
        }
    }

    public boolean makeAMove(int i) {
        if (currentPlayer == player) {
            if(i == checkMove(currentPlayer)){
                winner = ST_PLAYER;
            }
        }
//        checkDraw();
        if (matrix[i] != EMPTY) {
            return false;
        } else {
            matrix[i] = currentPlayer;
            currentPlayer = currentPlayer == X ? O : X;
//            if (turn == 9 && winner == ST_EMPTY) {
//                winner = ST_DRAW;
//            }
//            turn++;
        }
        if(winner==ST_EMPTY){
            boolean check=true;
            for(int m: matrix){
                if(m==EMPTY){
                    check=false;
                }
            }
            if(check){
                winner=ST_DRAW;
            }
        }
//        checkDraw();
        return true;
    }

    public int getCurrentPlayer() {
        return currentPlayer;
    }

    public void setCurrentPlayer(int currentPlayer) {
        this.currentPlayer = currentPlayer;
    }

    public int getPlayer() {
        return player;
    }

    public void setPlayer(int player) {
        this.player = player;
    }

    public int getComputer() {
        return computer;
    }

    public void setComputer(int computer) {
        this.computer = computer;
    }

    public int getWinner() {
        return winner;
    }

    public void setWinner(int winner) {
        this.winner = winner;
    }

    public char getValue(int i) {
        char result;
        switch (matrix[i]) {
            case X:
                result = c[0];
                break;
            case O:
                result = c[1];
                break;
            default:
                result = c[2];
                break;
        }
        return result;
    }
}
