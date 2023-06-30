
<%@page import="java.sql.*"%>

<!doctype html>
<html class="no-js" lang=""> 
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>JSP</title>
    <meta name="description" content="JSP">
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
    <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->
    <link href="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/jqvmap@1.5.1/dist/jqvmap.min.css" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/weathericons@2.1.0/css/weather-icons.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.css" rel="stylesheet" />
    <style>
    table {
      border-collapse: collapse;
    }

    th, td {
      padding: 5px;
      text-align: center;
      border: 1px solid black;
    }

    th {
      background-color: #ccc;
    }

    td {
      cursor: pointer;
    }

    td:hover {
      background-color: lightgray;
    }
  </style>




 
</head>

<body>
    
        <%
            Connection con;
            String url = "jdbc:mysql://localhost:3306/usuarios";
            String Driver = "com.mysql.jdbc.Driver";
            String user = "root";
            String clave = "1234";
            Class.forName(Driver);
            con = DriverManager.getConnection(url, user, clave);
            PreparedStatement ps;
            Statement smt;
            ResultSet rs;
            smt = con.createStatement();
            rs = smt.executeQuery("select * from usuario");
            
        %>
    
    
    
    <!-- Left Panel -->
    <aside id="left-panel" class="left-panel">
        <nav class="navbar navbar-expand-sm navbar-default">
            <div id="main-menu" class="main-menu collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active">
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
    </aside>

    <!-- /#left-panel -->
    <!-- Right Panel -->
    <div id="right-panel" class="right-panel">

        <!-- Content -->
        <div class="content">
            <!-- Animated -->
            <div class="animated fadeIn">

                <div class="clearfix"></div>
                <!-- Orders -->
                <div class="orders">
                    <div class="row">
                        <div class="col-xl-8">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="box-title">Lista de Usuarios </h4>
                                </div>
                                <div class="card-body--">
                                    <div class="table-stats order-table ov-h">
                                        <table class="table ">
                                            <thead>
                                                <tr>
                                                    <th class="serial">ID</th>
                                                   <%-- <th class="avatar">Miniatura</th> --%>  
                                                    <th>Nombre</th>
                                                    <th>estado civil</th>
                                                    <th>edad</th>
                                                    <th>correo</th>
                                                    <th></th>
                                                    <th>Edicion</th>
                                                    <th>Eliminar</th>
                                                </tr>
                                            </thead>
                                            
                        <%
                            while (rs.next()) {
                        %>                                      
                                            
                                            <tbody>
                                                <tr>
                                                    <td class="serial"><%= rs.getInt("id")%></td>
                                                    <td>  <span class="name"><%= rs.getString("nombre")%></span> </td>
                                                    <td> <span class="product"><%= rs.getString("estado")%></span> </td>
                                                    <td><span class="name"><%= rs.getString("edad")%></span></td>
                                                    <td>
                                                        <span class="name"><%= rs.getString("correo")%></span>
                                                    </td> 
                                                    <td>
                                                        
                                                    </td>
                                                    <td>
                                                        <a href="ui-cards.jsp?id=<%= rs.getInt("id")%>" class="badge badge-complete">Editar</a>
                                                    </td>
                                                    <td>
                                                        <a href="Delete.jsp?id=<%= rs.getInt("id")%>" class="badge badge-complete">X</a>
                                                    </td>
                                                   
                                                </tr>
                                               
                       <%}%>
                                                
                                            </tbody>
                                        </table>
                                    </div> <!-- /.table-stats -->
                                </div>
                            </div> <!-- /.card -->
                        </div>  <!-- /.col-lg-8 -->
                    </div>
                </div>
                <!-- /.orders -->
               <h2>Calendario</h2>
               <div id="calendar"></div>
                
            <!-- /#add-category -->
            </div>
            <!-- .animated -->
        </div>
        <!-- /.content -->
        
        <div class="clearfix"></div>
        <!-- Footer -->
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
        <!-- /.site-footer -->
    </div>
    <!-- /#right-panel -->

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>

    <!--  Chart js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.7.3/dist/Chart.bundle.min.js"></script>

    <!--Chartist Chart-->
    <script src="https://cdn.jsdelivr.net/npm/chartist@0.11.0/dist/chartist.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartist-plugin-legend@0.6.2/chartist-plugin-legend.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery.flot@0.8.3/jquery.flot.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-pie@1.0.0/src/jquery.flot.pie.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/flot-spline@0.0.1/js/jquery.flot.spline.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/simpleweather@3.1.0/jquery.simpleWeather.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/moment@2.22.2/moment.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.9.0/dist/fullcalendar.min.js"></script>
    <script>
    function generateCalendar() {
      // Obtener el elemento del calendario
      var calendar = document.getElementById('calendar');

      // Obtener la fecha actual
      var currentDate = new Date();

      // Obtener el mes y el año actual
      var currentMonth = currentDate.getMonth();
      var currentYear = currentDate.getFullYear();

      // Crear una instancia de fecha para el primer día del mes actual
      var firstDayOfMonth = new Date(currentYear, currentMonth, 1);

      // Obtener el número de días en el mes actual
      var daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

      // Crear la tabla del calendario
      var table = document.createElement('table');

      // Crear la fila de encabezado del calendario
      var headerRow = document.createElement('tr');
      var daysOfWeek = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
      for (var i = 0; i < 7; i++) {
        var th = document.createElement('th');
        th.textContent = daysOfWeek[i];
        headerRow.appendChild(th);
      }
      table.appendChild(headerRow);

      // Calcular el número de celdas vacías antes del primer día del mes
      var emptyCells = firstDayOfMonth.getDay();

      // Calcular el número total de filas necesarias en el calendario
      var totalRows = Math.ceil((emptyCells + daysInMonth) / 7);

      // Variables para rastrear el día actual
      var dayCount = 1;
      var nextMonthDayCount = 1;
      var isCurrentMonth = false;

      // Crear las filas y celdas del calendario
      for (var row = 0; row < totalRows; row++) {
        var tr = document.createElement('tr');

        for (var col = 0; col < 7; col++) {
          var td = document.createElement('td');

          // Si estamos en las celdas vacías antes del primer día del mes
          if (row === 0 && col < emptyCells) {
            td.textContent = '';

          // Si hemos superado el último día del mes
          } else if (dayCount > daysInMonth) {
            td.textContent = nextMonthDayCount++;
            td.style.color = 'gray';

          // Si estamos en el mes actual
          } else {
            td.textContent = dayCount++;
            isCurrentMonth = true;
          }

          // Estilizar el día actual
          if (isCurrentMonth && dayCount - 1 === currentDate.getDate()) {
            td.style.backgroundColor = 'lightblue';
          }

          // Cambiar al siguiente mes si hemos superado el último día del mes actual
          if (dayCount > daysInMonth) {
            isCurrentMonth = false;
          }

          tr.appendChild(td);
        }

        table.appendChild(tr);
      }

      // Agregar la tabla del calendario al elemento del calendario
      calendar.appendChild(table);
    }

    // Llamar a la función para generar el calendario al cargar la página
    generateCalendar();
  </script>


    <!--Local Stuff-->
  
</body>
</html>
