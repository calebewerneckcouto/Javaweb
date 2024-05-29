package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelCadastroGeral;

import model.ModelLogin;
import model.ModelVideoNome;
import model.ModelVideos;


public class DAOCadastroGeral {

	private static Connection connection;
	
	

	public DAOCadastroGeral() {
		connection = SingleConnectionBanco.getConnection();

	}
	
	
	


	public void gravaGeral(ModelCadastroGeral modelGeral) throws Exception {

		String sql = "insert into cadastrogeral (custoenergia,custodetrabalho,taxadeperdas,unidademonetaria,totalgeral,idusuariologado) values (?,?,?,?,?,?)";

		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setString(1, modelGeral.getCustoenergia());
		preparedStatement.setString(2, modelGeral.getCustodetrabalho());
		preparedStatement.setString(3, modelGeral.getTaxadeperdas());
		preparedStatement.setString(4,modelGeral.getUnidademonetaria());
		preparedStatement.setString(5,modelGeral.getTotalgeral());
		preparedStatement.setString(6,modelGeral.getIdusuariologado());
		
	

		preparedStatement.execute();

		connection.commit();

	}
	
	
	
		
		
	
	public List<ModelCadastroGeral> buscarCadastroGeral() throws Exception {
	    List<ModelCadastroGeral> cadastrogeral = new ArrayList<>();

	    String sql = "select id,custoenergia,custodetrabalho,taxadeperdas,unidademonetaria,totalgeral,idusuariologado  from cadastrogeral ";

	    PreparedStatement preparedStatement = connection.prepareStatement(sql);

	    ResultSet resultSet = preparedStatement.executeQuery();

	    while (resultSet.next()) {
	    	ModelCadastroGeral caGeral = new ModelCadastroGeral();
	        caGeral.setId(resultSet.getLong("id"));
	        caGeral.setCustoenergia(resultSet.getString("custoenergia"));
	        caGeral.setCustodetrabalho(resultSet.getString("custodetrabalho"));
	        caGeral.setTaxadeperdas(resultSet.getString("taxadeperdas"));
	        caGeral.setUnidademonetaria(resultSet.getString("unidademonetaria"));
	        caGeral.setTotalgeral(resultSet.getString("totalgeral"));
	        caGeral.setIdusuariologado(resultSet.getString("idusuariologado"));
	       
	        
	        cadastrogeral.add(caGeral);
	    }

	    resultSet.close();
	    preparedStatement.close();

	    return cadastrogeral;
	}

	
	public List<ModelCadastroGeral> buscaridgeral() throws Exception {
	    List<ModelCadastroGeral> idcadastrogeral = new ArrayList<>();

	    String sql = "select id,custoenergia,custodetrabalho,taxadeperdas,unidademonetaria,totalgeral,idusuariologado  from cadastrogeral ";

	    PreparedStatement preparedStatement = connection.prepareStatement(sql);

	    ResultSet resultSet = preparedStatement.executeQuery();

	    while (resultSet.next()) {
	    	ModelCadastroGeral caGeral = new ModelCadastroGeral();
	        caGeral.setIdusuariologado(resultSet.getString("idusuariologado"));
	        
	        idcadastrogeral.add(caGeral);
	    }

	    resultSet.close();
	    preparedStatement.close();

	    return idcadastrogeral;
	}

	
	
	public List<ModelCadastroGeral> buscaridusuariologado(String idusuariologado) throws Exception {
	    List<ModelCadastroGeral> idcadastrogeral = new ArrayList<>();

	    String sql = "select idusuariologado from cadastrogeral where idusuariologado=?";

	    PreparedStatement preparedStatement = connection.prepareStatement(sql);
	    
	    preparedStatement.setString(1, idusuariologado);

	    ResultSet resultSet = preparedStatement.executeQuery();

	    while (resultSet.next()) {
	    	ModelCadastroGeral caGeral = new ModelCadastroGeral();
	        caGeral.setIdusuariologado(resultSet.getString("idusuariologado"));
	        
	        idcadastrogeral.add(caGeral);
	    }

	    resultSet.close();
	    preparedStatement.close();

	    return  idcadastrogeral;
	}

	
	
	

	
	

	public void deletecadastrogeral(Long id) throws Exception {
		
		String sql = "delete from cadastrogeral where id =?";
		
		PreparedStatement preparedStatement = connection.prepareStatement(sql);

		preparedStatement.setLong(1, id);

		preparedStatement.executeUpdate();

		connection.commit();
	}
}
	
	
	