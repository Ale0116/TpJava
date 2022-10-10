package ModelDao;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import interfaces.CRUD;
import model.DbConnector;
import model.Localidades;

public class LocalidadesDao implements CRUD {
	
	DbConnector cn= new DbConnector();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	Localidades l= new Localidades();
	
	
	@Override
	public List<Localidades> listar() {
		ArrayList<Localidades>listLoc=new ArrayList<>();
		String sql="select * from localidades";
		try {
			con=cn.getConn();
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while (rs.next()) {
				Localidades loc= new Localidades();
				loc.setId(rs.getInt("id"));
				loc.setId_privincia(rs.getInt("id_privincia"));
				loc.setLocalidad(rs.getString("localidad"));
				listLoc.add(loc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
 
			
		}
		return listLoc;
	}


	@Override
	public Localidades list(int id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean add(Localidades loc) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean edit(Localidades loc) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public boolean eliminar(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	

}
