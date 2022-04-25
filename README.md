# TicTacToe
<a href="web/index.html"></a>
Hi there, here is a Tic Tac Toe game :smile:

This is the version that player could beat computer :angel:

For a version player neverrrrrr win, may be you could change the createRandomMove into this:

    public int createRandomMove() {
        if (matrix[4] == EMPTY) {
            return 4;
        } else if (matrix[0] == EMPTY) {
            return 0;
        } else if (matrix[2] == EMPTY) {
            return 2;
        } else if (matrix[6] == EMPTY) {
            return 6;
        } else if (matrix[8] == EMPTY) {
            return 8;
        } else if (matrix[1] == EMPTY) {
            return 1;
        } else if (matrix[3] == EMPTY) {
            return 3;
        } else if (matrix[5] == EMPTY) {
            return 5;
        } else if (matrix[7] == EMPTY) {
            return 7;
        }
        return -1;
    }
