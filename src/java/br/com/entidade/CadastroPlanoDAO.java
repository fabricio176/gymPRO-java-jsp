package br.com.entidade;

import br.com.controle.Plano;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CadastroPlanoDAO extends DAO {

    public void inserir(Plano plano) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO plano (codigo, nome, tipo, valor) VALUES (null,?,?,?)";
            pst = con.prepareStatement(query);
            pst.setString(1, plano.getNome());
            pst.setString(2, plano.getTipo());
            pst.setString(3, plano.getValor());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao inserir plano: " + e.getMessage());
        }
    }

    public ArrayList<Plano> pesquisarTudo() throws Exception {
        ArrayList<Plano> listaPlanos = new ArrayList<>();
        try {
            abrirBanco();
            String query = "SELECT codigo, nome, tipo, valor FROM plano";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Plano plano = new Plano();
                plano.setCodigo(rs.getInt("codigo"));
                plano.setNome(rs.getString("nome"));
                plano.setTipo(rs.getString("tipo"));
                plano.setValor(rs.getString("valor"));
                listaPlanos.add(plano);
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao pesquisar todos os planos: " + e.getMessage());
        }
        return listaPlanos;
    }

    public void deletar(Plano plano) throws Exception {
        try {
            abrirBanco();
            String query = "DELETE FROM plano WHERE codigo=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, plano.getCodigo());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao deletar plano: " + e.getMessage());
        }
    }

    public void alterar(Plano plano) throws Exception {
        try {
            abrirBanco();
            String query = "UPDATE plano SET nome=?, tipo=?, valor=? WHERE codigo=?";
            pst = con.prepareStatement(query);
            pst.setString(1, plano.getNome());
            pst.setString(2, plano.getTipo());
            pst.setString(3, plano.getValor());
            pst.setInt(4, plano.getCodigo());
            pst.executeUpdate();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao alterar plano: " + e.getMessage());
        }
    }

    public Plano pesquisar(int codigo) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT * FROM plano WHERE codigo=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, codigo);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Plano plano = new Plano();
                plano.setCodigo(rs.getInt("codigo"));
                plano.setNome(rs.getString("nome"));
                plano.setTipo(rs.getString("tipo"));
                plano.setValor(rs.getString("valor"));
                fecharBanco();
                return plano;
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao pesquisar plano: " + e.getMessage());
        }
        return null;
    }
}
