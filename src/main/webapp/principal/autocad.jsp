<%@page import="model.ModelVideos"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

    <link rel="stylesheet" href="assets/css/stylecssoaginas.css">

<body>
    <header>
        <h1 class="titulo">Autocad</h1>
    </header>

    <div class="container">
        <div class="video-wrapper">
           <% 
List<ModelVideos> videos = (List<ModelVideos>) request.getAttribute("videos"); // Ajuste para ModelVideos
if (videos!= null &&!videos.isEmpty()) { // Verifica se a lista não está vazia
    for (ModelVideos video : videos) { %>
        <div class="video">
            <div class="video-area">
            <div>
                
                <%=video.getLink() %> <!-- Acessa a propriedade link -->
            </div>
        </div>
    <% 
    }
} else { %>
    <p>Nenhum vídeo encontrado.</p>
<% } %>
</div>
        
        <div class="botaolink">
            <a href="<%=request.getContextPath()%>/principal/principal.jsp" class="btn btn-secondary">HOME</a>
        </div>
    </div>

    <jsp:include page="javascripfile.jsp"></jsp:include>
</body>

</html>
