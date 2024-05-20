package br.com.entidade;

import br.com.controle.Aluno;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CadastroUsuarioDAO extends DAO {

    public void inserir(Aluno aluno) throws Exception {
        try {
            abrirBanco();
            String query = "INSERT INTO aluno (matricula, nome, senha, cpf, endereco, telefone)"
                    + " VALUES (null,?,?,?,?,?)";
            pst = con.prepareStatement(query);
            pst.setString(1, aluno.getNome());
            pst.setString(2, aluno.getSenha());
            pst.setString(3, aluno.getCpf());
            pst.setString(4, aluno.getEndereco());
            pst.setString(5, aluno.getTelefone());
            pst.execute();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao inserir aluno: " + e.getMessage());
        }
    }

    public ArrayList<Aluno> pesquisarTudo() throws Exception {
        ArrayList<Aluno> listaAlunos = new ArrayList<>();
        try {
            abrirBanco();
            String query = "SELECT matricula, nome, senha, cpf, endereco, telefone FROM aluno";
            pst = con.prepareStatement(query);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setMatricula(rs.getInt("matricula"));
                aluno.setNome(rs.getString("nome"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEndereco(rs.getString("endereco"));
                aluno.setTelefone(rs.getString("telefone"));
                listaAlunos.add(aluno);
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao pesquisar todos os alunos: " + e.getMessage());
        }
        return listaAlunos;
    }

     public boolean deletar(Aluno aluno) throws Exception {
        try {
            abrirBanco();
            String query = "DELETE FROM aluno WHERE matricula=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, aluno.getMatricula());
            int rowsAffected = pst.executeUpdate();
            fecharBanco();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Erro ao deletar aluno: " + e.getMessage());
            throw new Exception("Erro ao deletar aluno", e);
        }
    }


    public void alterar(Aluno aluno) throws Exception {
        try {
            abrirBanco();
            String query = "UPDATE aluno SET nome=?, senha=?, cpf=?, endereco=?, telefone=? WHERE matricula=?";
            pst = con.prepareStatement(query);
            pst.setString(1, aluno.getNome());
            pst.setString(2, aluno.getSenha());
            pst.setString(3, aluno.getCpf());
            pst.setString(4, aluno.getEndereco());
            pst.setString(5, aluno.getTelefone());
            pst.setInt(6, aluno.getMatricula());
            pst.executeUpdate();
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao alterar aluno: " + e.getMessage());
        }
    }

    public Aluno pesquisar(int matricula) throws Exception {
        try {
            abrirBanco();
            String query = "SELECT * FROM aluno WHERE matricula=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, matricula);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                Aluno aluno = new Aluno();
                aluno.setMatricula(rs.getInt("matricula"));
                aluno.setNome(rs.getString("nome"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEndereco(rs.getString("endereco"));
                aluno.setTelefone(rs.getString("telefone"));
                fecharBanco();
                return aluno;
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao pesquisar aluno: " + e.getMessage());
        }
        return null;

    }

    public Aluno getUsuarioByMatricula(int matricula) throws Exception {
        Aluno aluno = null;
        try {
            abrirBanco();
            String query = "SELECT * FROM aluno WHERE matricula=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, matricula);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                aluno = new Aluno();
                aluno.setMatricula(rs.getInt("matricula"));
                aluno.setNome(rs.getString("nome"));
                aluno.setSenha(rs.getString("senha"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setEndereco(rs.getString("endereco"));
                aluno.setTelefone(rs.getString("telefone"));
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao pesquisar aluno: " + e.getMessage());
            fecharBanco();
            throw e;
        }
        return aluno;
    }
    
    
    public Aluno autenticar(String cpf, String senha) throws Exception {
        Aluno aluno = null;
        try {
            abrirBanco();
            String query = "SELECT * FROM aluno WHERE cpf=? AND senha = ?";
            pst = con.prepareStatement(query);
            pst.setString(1, cpf);
            pst.setString(2, senha);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                aluno = new Aluno();
                aluno.setMatricula(rs.getInt("matricula"));
                aluno.setCpf(rs.getString("cpf"));
                aluno.setSenha(rs.getString("senha"));
            }
            fecharBanco();
        } catch (Exception e) {
            System.out.println("Erro ao autenticar cpf: " + e.getMessage());
            fecharBanco();
            throw e;
        }
        return aluno;
    }
    
}
