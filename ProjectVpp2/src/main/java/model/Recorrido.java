package model;


import java.time.LocalTime;

public class Recorrido {
	
	private int idRecorrido;
	private int idTipoColectivo;
	private LocalTime hsSalida;
	private LocalTime hsLlegada;
	private int idLocSalida;
	private int idLocLlegada;
	
	
	public int getIdRecorrido() {
		return idRecorrido;
	}
	public void setIdRecorrido(int idRecorrido) {
		this.idRecorrido = idRecorrido;
	}
	public int getIdTipoColectivo() {
		return idTipoColectivo;
	}
	public void setIdTipoColectivo(int idTipoColectivo) {
		this.idTipoColectivo = idTipoColectivo;
	}
	public LocalTime getHsSalida() {
		return hsSalida;
	}
	public void setHsSalida(LocalTime hsSalida) {
		this.hsSalida = hsSalida;
	}
	public LocalTime getHsLlegada() {
		return hsLlegada;
	}
	public void setHsLlegada(LocalTime hsLlegada) {
		this.hsLlegada = hsLlegada;
	}
	public int getIdLocSalida() {
		return idLocSalida;
	}
	public void setIdLocSalida(int idLocSalida) {
		this.idLocSalida = idLocSalida;
	}
	public int getIdLocLlegada() {
		return idLocLlegada;
	}
	public void setIdLocLlegada(int idLocLlegada) {
		this.idLocLlegada = idLocLlegada;
	}
	
	public Recorrido buscarRecorrido();
	

}
