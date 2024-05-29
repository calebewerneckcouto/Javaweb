<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    header {
        background-color: #333;
        color: #fff;
        padding: 10px;
        text-align: center;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
    }

    .video-wrapper {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
    }

    .video-info {
        text-align: center;
    }

    iframe {
        width: 100%;
        height: 400px;
    }
</style>

<body>
    <header>
        <h1>Compilar Marlin</h1>
    </header>

    <div class="container">
        <div class="video-wrapper">
            <%-- Importar classes necessárias --%>
            <%@ page import="java.sql.*" %>

            <%-- Configurar informações do banco de dados --%>
            <%
            String banco = "jdbc:postgresql://localhost:5432/cwcdcomb_curso_jsp?autoReconnect=true";
			String user = "cwcdcomb_cwc3d";
			String senha = "cwc3d14694899";
			Connection conn = null;

                try {
                    Class.forName("org.postgresql.Driver");
                    conn = DriverManager.getConnection(banco, user, senha);

                    String sql = "SELECT nomevideo, link FROM videos WHERE pagina = ?";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, "compilamarlin.jsp");

                    ResultSet resultSet = statement.executeQuery();

                    while (resultSet.next()) {
                        String nomevideo = resultSet.getString("nomevideo");
                        String link = resultSet.getString("link");
            %>
                        <div class="video-info">
                            <h3><%= nomevideo %></h3>
                           <h3> <%= link %></h3>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </div>
        
                                <a  href="<%=request.getContextPath() %>/principal/principal.jsp" class="btn btn-secondary"  >HOME</a>
                                      
    </div>

    <jsp:include page="javascripfile.jsp"></jsp:include>
</body>

</html>
