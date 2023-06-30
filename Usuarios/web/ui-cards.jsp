

<%@page import="java.sql.*"%>
<%@page import="java.awt.TrayIcon.MessageType"%>
<%@page import="javax.swing.JOptionPane"%>

<!doctype html>
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Editar</title>
    <meta name="description" content="Final">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="images/logo1.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="assets/css/style.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>
    

    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">

            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="index.jsp"><i class="menu-icon fa fa-laptop"></i>Inicio</a>
                    </li>
                    <li class="menu-title">Plantillas</li><!-- /.menu-title -->
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-table"></i>Lista de usuarios</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="fa fa-table"></i><a href="tables-data.jsp">Lista</a></li>
                        </ul>
                    </li>
                    <li class="menu-item-has-children dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-th"></i>Agregar usuario</a>
                        <ul class="sub-menu children dropdown-menu">
                            <li><i class="menu-icon fa fa-th"></i><a href="forms-basic.jsp">Agregar</a></li>
                        </ul>
                    </li>


                </ul>
            </div><!-- /.navbar-collapse -->
        </nav>
    </aside><!-- /#left-panel -->

    <!-- Left Panel -->

            <%
                Connection con;
                String url="jdbc:mysql://localhost:3306/usuarios";
                String Driver="com.mysql.jdbc.Driver";
                String user="root";
                String clave="1234";
                Class.forName(Driver);
                con=DriverManager.getConnection(url,user,clave);
                //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
                PreparedStatement ps;
                ResultSet rs;
                int id=Integer.parseInt(request.getParameter("id"));
                ps=con.prepareStatement("select * from usuario where id="+id);
                rs=ps.executeQuery();
            %>
    
    
    <!-- Right Panel -->

    <div id="right-panel" class="right-panel">


        <div class="content">
            <div class="animated fadeIn">
                <div class="row">

                    <div class="col-md-4">
                        <aside class="profile-nav alt">
                            
                         <%
                            while (rs.next()) {
                        %>                         
                        
                        
                            <section class="card">
                                
                                <form action="" method="post" class="form-horizontal">
                                    <div class="card-header user-header alt bg-dark">
                                        <div class="media">
                                            
                                                                          
                                                
                                            <div class="media-body">
                                                <p>Nombre</p>
                                                <input type="text" id="text-input" name="txtNombre"  class="form-control" value="<%= rs.getString("nombre")%>">
                                                <p>ID: <%= rs.getInt("id")%></p>
                                            </div>
                                        </div>
                                    </div>

                                            
                                           
                                    <ul class="list-group list-group-flush">
                                         
                                        <li class="list-group-item">
                                            <p>Estado Civil</p>
                                            <select name="estadoCi" id="select" class="form-control" value="<%= rs.getString("estado")%>" >
                                                <option disabled  selected><%= rs.getString("estado")%></option>
                                                <option>Soltero/a</option>
                                                <option>Casado/a</option>
                                                <option>Divorciado/a</option>
                                                <option>Viudo/a</option>
                                                <option>Union libre</option>
                                            </select>
                                        </li>
                                        <li class="list-group-item">
                                            <p>Edad</p>
                                            <input name="txtEdad" id="textarea-input" rows="4"  class="form-control" value="<%= rs.getString("edad")%>">
                                        </li>
                                        <li class="list-group-item">
                                            <p>Correo</p>
                                            <input type="text" id="textinput1" name="txtCorreo"  class="form-control" value="<%= rs.getString("correo")%>">
                                        </li>              
                                    </ul>                                  
                                        <ul class="list-group">
                                            <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                                        </ul>                               
                                </form>

                            </section>
                            
                          <%}%>  
                            
                        </aside>
                    </div>


                </div><!-- .row -->
            </div><!-- .animated -->
        </div><!-- .content -->

    <div class="clearfix"></div>

    <footer class="site-footer">
        <div class="footer-inner bg-white">
            <div class="row">
                <div class="col-sm-6">
                    JSP Example
                </div>
                <div class="col-sm-6 text-right">
                    Designed by <a href="https://colorlib.com">Colorlib</a>
                </div>
            </div>
        </div>
    </footer>


    </div><!-- /#right-panel -->

    <!-- Right Panel -->

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="assets/js/main.js"></script>


</body>
</html>
<%     
    String nombre, estado, edad, correo;
    nombre=request.getParameter("txtNombre");
    estado=request.getParameter("estadoCi");
    edad=request.getParameter("txtEdad");
    correo=request.getParameter("txtCorreo");
    
    if(nombre!=null){
        ps=con.prepareStatement("update usuario set nombre='"+nombre+"', estado='"+estado+"', edad='"+edad+"', correo='"+correo+"'where id="+id);
        ps.executeUpdate();          
        response.sendRedirect("index.jsp");        
    }

 %>