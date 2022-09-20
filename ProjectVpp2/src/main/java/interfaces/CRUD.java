package interfaces;

import model.Localidades;
import java.util.List;

public interface CRUD {
	public List<?> listar();
	public Localidades list (int id);
	public boolean add(Localidades loc);
	public boolean edit(Localidades loc);
	public boolean eliminar(int id);
}
