<%@page import="tictactoe.Board"%> <%@ page import = "javax.servlet.*" %> <%@
page import = "javax.servlet.http.*" %> <%@ page import =
"javax.servlet.http.HttpSession" %> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>TICTACTOE</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="index.css" />
    <link rel="icon" href="header.jpg" />
  </head>
  <% HttpSession sess = request.getSession(true); session.setAttribute("board",
  new Board()); %>
  <body>
    <div class="header">
      <form action="tictactoe.jsp">
        <div class="turn">
            <h1 class="header_text">Who go first ?</h1>
            <div class="body">
                <div>
                    <div class="choose" onclick="inputCheck1()">
                        <p>
                            <input id="check1" type="radio" name="first" value="player" checked /> Player first
                        </p>
                    </div>
                    <div class="choose" onclick="inputCheck2()">
                        <p>
                            <input id="check2" type="radio" name="first" value="computer" /> Computer first
                        </p>
                    </div>    
                </div>
                <input type="hidden" name="playerName"
                value="<%=request.getParameter("playerName")%>"/>
                <button type="submit" class="btn">Play</button>
            </div>
        </div>
      </form>
    </div>
  </body>
  <script>
      btnChoose1 = document.getElementById('check1');
      btnChoose2 = document.getElementById('check2');
      function inputCheck1() {
          btnChoose1.checked = !btnChoose1.checked;
      }
      function inputCheck2() {
          btnChoose2.checked = !btnChoose2.checked;
      }
  </script>
</html>
