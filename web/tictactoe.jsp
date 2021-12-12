<%@page import="tictactoe.Board"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TICTACTOE</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="stylesheet.css" />
        <link rel="icon" href="header.jpg" />
    </head>
    <body>
        <div class="page">
            <div class="left">
                <%
                    HttpSession sess = request.getSession(true);
                    Board board = (Board) session.getAttribute("board");
                    String first = request.getParameter("first");
                    String move = request.getParameter("move");
                    String playerName = request.getParameter("playerName");
                    if (move != null) {
                        try {
                            int m = Integer.parseInt(move) - 1;
                            if (m >= 0 && m <= 8) {
                                boolean check = board.makeAMove(m);
                                if (!check) {
                                    //alert, cell has value
                                    out.print("<h3 class='alert'>Cell has value<h3>");
                                }
                            } else {
                                //alert when user dont enter int in range
                                out.print("<h3 class='alert'>Invalid value<h3>");
                            }
                        } catch (Exception e) {
                            //alert when user dont enter int
                            out.print("<h3 class='alert'>Invalid value<h3>");
                        }
                    }
                    if (first.equals("computer")) {
                        if (board.getCurrentPlayer() == Board.X) {
                            board.setComputer(Board.X);
                            board.setPlayer(Board.O);
                            board.makeAMove(board.createOptimalMove());
                        }
                    } else {
                        if (board.getWinner() != Board.ST_DRAW) {
                            if (board.getCurrentPlayer() == Board.O) {
                                board.setComputer(Board.O);
                                board.setPlayer(Board.X);
                                board.makeAMove(board.createOptimalMove());
                            }
                        }
                    }

                %>

                <div class="board">
                    <%for (int i = 0; i < 9; i++) {%>
                    <div class="cell">
                        <span class="cell-content"><%=board.getValue(i)%></span>
                    </div>
                    <%}%>
                </div>
                <%  int winner = board.getWinner();
                    if (winner != Board.ST_EMPTY) {
                        switch (winner) {
                            case Board.ST_DRAW:
                                out.print("<h3 class='win'>DRAW</h3>");
                                break;
                            case Board.ST_COMPUTER:
                                out.print("<h3 class='win'>COMPUTER WINS</h3>");
                                break;
                            case Board.ST_PLAYER:
                                out.print("<h3 class='win'>PLAYER " + playerName + " WINS</h3>");
                                break;
                        }
                        board.resetGame();
                    }%>
            </div>
            <div class="right">
                <div>
                    <form action="tictactoe.jsp" method="post">
                        <input name="move" type="text" class="form-name" autocomplete="off" placeholder="Enter move [1-9]" required/>
                        <input type="hidden" name="first" value="<%out.print(first);%>">
                        <input type="hidden" name="playerName" value="<%out.print(playerName);%>">
                        <div class="btn-move"><button type="submit" class="btn">PLAY MOVE</button></div>
                    </form>
                </div>
                <div class="">
                    <form action="index.jsp">
                        <input type="hidden" name="playerName" value="<%out.print(playerName);%>">
                        <button class="btn">NEW GAME</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
