package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SingleConnectionBanco {
    
    private static String banco = "jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
    private static String user = "postgres"; // Coloque seu usuário
    private static String senha = "admin";   // Coloque sua senha
    private static Connection connection = null;

    public static Connection getConnection() {
        return connection;
    }

    static {
        conectar();
    }

    public SingleConnectionBanco() {
        conectar();
    }

    private static void conectar() {
        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("org.postgresql.Driver");
                connection = DriverManager.getConnection(banco, user, senha);
                connection.setAutoCommit(false);
                System.out.println("Conexão estabelecida com sucesso!");
            }
        } catch (Exception e) {
            System.err.println("Erro ao conectar com o banco de dados:");
            e.printStackTrace();
        }
    }

    // Método para fechar a conexão
    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
                System.out.println("Conexão fechada com sucesso!");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao fechar a conexão:");
            e.printStackTrace();
        } finally {
            connection = null; // Garante que a referência seja limpa
        }
    }

    // Método para verificar se a conexão está aberta
    public static boolean isConnectionOpen() {
        try {
            return connection != null && !connection.isClosed();
        } catch (SQLException e) {
            return false;
        }
    }

    // Método para commit e fechamento
    public static void commitAndClose() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.commit();
                connection.close();
                System.out.println("Commit realizado e conexão fechada!");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao realizar commit e fechar conexão:");
            e.printStackTrace();
        } finally {
            connection = null;
        }
    }

    // Método para rollback e fechamento
    public static void rollbackAndClose() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.rollback();
                connection.close();
                System.out.println("Rollback realizado e conexão fechada!");
            }
        } catch (SQLException e) {
            System.err.println("Erro ao realizar rollback e fechar conexão:");
            e.printStackTrace();
        } finally {
            connection = null;
        }
    }

    // Destructor (chamado quando o objeto é garbage collected)
    @Override
    protected void finalize() throws Throwable {
        try {
            closeConnection();
        } finally {
            super.finalize();
        }
    }
}