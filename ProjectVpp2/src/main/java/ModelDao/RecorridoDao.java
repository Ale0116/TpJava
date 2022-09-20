package ModelDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import interfaces.CRUD;
import model.DbConnector;
import model.Localidades;
import model.Recorrido;

public class RecorridoDao implements CRUD{

	DbConnector cn= new DbConnector();
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	Localidades l= new Localidades();
	
	
	
	@Override
	public List<Recorrido> listar() {
		
		ArrayList<Recorrido>list=new ArrayList<>(); {
			String sql="select * from recorrido";
			try {
				con=cn.getConn();
				ps=con.prepareStatement(sql);
				rs=ps.executeQuery();
				while (rs.next()) {
					Recorrido rec= new Recorrido();
					//rec.setHsLlegada(rs.g));
					rec.setHsSalida(null);
					rec.setIdLocLlegada(0);
					rec.setHsSalida(null);
					rec.setIdRecorrido(0);
					rec.setIdTipoColectivo(0);
					
				}
			} catch (Exception e) {
				
			}
			return list;
		}
		
		// TODO Auto-generated method stub
		
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
	public Recorrido getById(Recorrido r) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
