<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="model.Localidad" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Prueba Listado DropDownButton</title>
</head>
<body>


	
	
	<select> 

		<option>Select</option>	
		
		<%

	try	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/venta_pasajes", "root", "0116");
		Statement st = con.createStatement();	
		String query ="Select * from Localidades";
		// obtengo la tabla de localidades
		
		ResultSet rs=st.executeQuery(query);
		
		while (rs.next()){	
			%>
			
			<option> <%=rs.getString("nombre_loc") %></option>
			<% 
						}
		
		
		
	}catch (Exception e){
						}

		%>

	</select>

<A HREF="default.jsp">Volver a inicio</A></th></tr>

	
	
</body>
</html>