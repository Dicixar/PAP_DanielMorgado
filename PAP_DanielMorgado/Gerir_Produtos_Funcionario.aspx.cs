using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using System.Globalization;

namespace PAP_DanielMorgado
{
    public partial class Gerir_Produtos_Funcionario : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_criar_Click(object sender, EventArgs e)
        {
            if (flp_foto.HasFile == false)
            {
                MessageBox.Show("O Produto tem que ter uma Foto ", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                string filename = System.IO.Path.GetFileName(flp_foto.FileName);
                flp_foto.SaveAs(Server.MapPath("img/") + filename);
                MySqlConnection ligar = new MySqlConnection(configuracao);
                MySqlCommand inserir_modelo = new MySqlCommand();
                inserir_modelo.Connection = ligar;
                ligar.Open();

                inserir_modelo.CommandText = "Insert into modelo(desc_modelo, id_marca) values ('" + txt_modelo.Text + "','" + ddl_marca.SelectedValue + "')";

                try
                {
                    inserir_modelo.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    MessageBox.Show(erro.Message);
                }
                finally
                {
                    ligar.Close();
                }

                MySqlConnection ligar3 = new MySqlConnection(configuracao);

                MySqlDataReader DR;
                MySqlCommand comando = new MySqlCommand();
                comando.Connection = ligar3;
                ligar3.Open();
                comando.CommandText = "SELECT id_modelo FROM modelo where desc_modelo = '" + txt_modelo.Text + "'";
                DR = comando.ExecuteReader();
                if (DR.Read())
                {
                    txt_idmodelo.Text = DR["id_modelo"].ToString();
                }
                ligar3.Close();

                decimal preco = decimal.Parse(txt_preco.Text);
                string preco_ponto = preco.ToString(CultureInfo.GetCultureInfo("en-US").NumberFormat);
                MySqlConnection ligar2 = new MySqlConnection(configuracao);
                MySqlCommand inserir_produto = new MySqlCommand();
                inserir_produto.Connection = ligar2;
                ligar2.Open();

                inserir_produto.CommandText = "Insert into produto(id_tipo_produto, id_modelo, preco, foto, garantia, descricao, quantidade) values (@id_tipo_produto, @id_modelo, @preco, @foto, @garantia, @descricao, @quantidade) ";
                inserir_produto.Parameters.AddWithValue("@id_tipo_produto", ddl_categoria.SelectedValue);
                inserir_produto.Parameters.AddWithValue("@id_modelo", txt_idmodelo.Text);
                inserir_produto.Parameters.AddWithValue("@preco", preco_ponto.ToString());
                inserir_produto.Parameters.AddWithValue("@foto", filename);
                inserir_produto.Parameters.AddWithValue("@garantia", ddl_garantia.SelectedValue);
                inserir_produto.Parameters.AddWithValue("@descricao", txt_desc.Text);
                inserir_produto.Parameters.AddWithValue("@quantidade", txt_unidades.Text);
                try
                {
                    inserir_produto.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    MessageBox.Show(erro.Message);
                }
                finally
                {
                    ligar2.Close();
                    Response.Redirect("Gerir_Produtos_Funcionario.aspx", false);
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            flp_foto.Visible = true;
            btn_criar.Visible = false;
            btn_editar.Visible = true;
            btn_eliminar.Visible = true;
            lbl_foto.Visible = false;
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            int linha = GridView1.SelectedIndex;
            string cod = GridView1.Rows[linha].Cells[1].Text;
            string preco = GridView1.Rows[linha].Cells[4].Text;
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT produto.id_produto, tipo_produto.id_tipo_produto, tipo_produto.descricao_produto, modelo.desc_modelo, marca.id_marca, produto.preco, produto.foto, produto.garantia, produto.descricao, produto.quantidade FROM marca INNER JOIN modelo ON marca.id_marca = modelo.id_marca INNER JOIN produto ON modelo.id_modelo = produto.id_modelo INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto where id_produto ='" + cod.ToString() + "'";
            DR = comando.ExecuteReader();

            if (DR.Read())
            {
                string preco_ponto = preco.ToString(CultureInfo.GetCultureInfo("en-US").NumberFormat);
                ddl_marca.SelectedValue = DR["id_marca"].ToString();
                txt_idmodelo.Text = DR["id_produto"].ToString();
                txt_modelo.Text = DR["desc_modelo"].ToString();
                txt_desc.Text = DR["descricao"].ToString();
                ddl_categoria.SelectedValue = DR["id_tipo_produto"].ToString();
                txt_unidades.Text = DR["quantidade"].ToString();
                txt_preco.Text = preco_ponto;
                ddl_garantia.SelectedValue = DR["garantia"].ToString();

                ligar3.Close();
            }
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            int linha = GridView1.SelectedIndex;
            string codigo = GridView1.Rows[linha].Cells[1].Text;



            MySqlConnection ligar7 = new MySqlConnection(configuracao);
            MySqlCommand apagar_modelo = new MySqlCommand();
            apagar_modelo.Connection = ligar7;
            ligar7.Open();
            apagar_modelo.CommandText = "DELETE FROM produto WHERE id_produto = '" + codigo.ToString() + "'";
            try
            {
                if (MessageBox.Show("Tem a Certeza que pretende eliminar o Produto: " + txt_modelo.Text, "Eliminar Produto", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                {
                    apagar_modelo.ExecuteNonQuery();
                }
                else
                {
                    MessageBox.Show("Operação Cancelada!", "Eliminar Produto", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
            catch (Exception er)
            {
                MessageBox.Show("Não pode Eliminar este produto porque está associado a uma encomenda", "Aviso");
            }
            finally
            {
                ligar7.Close();
            }
            GridView1.SelectedIndex = -1;

            MySqlConnection ligar5 = new MySqlConnection(configuracao);
            MySqlCommand apagar_funcionario = new MySqlCommand();
            apagar_funcionario.Connection = ligar5;
            ligar5.Open();
            apagar_funcionario.CommandText = "DELETE FROM modelo WHERE desc_modelo = '" + txt_modelo.Text + "'";
            try
            {
                apagar_funcionario.ExecuteNonQuery();
                Response.Redirect("Gerir_Produtos_Funcionario.aspx", false);
            }
            catch (Exception er)
            {
                
            }
            finally
            {
                ligar5.Close();
            }
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            int linha = GridView1.SelectedIndex;
            string codigo = GridView1.Rows[linha].Cells[1].Text;
            if (flp_foto.HasFile == false)
            {
                MySqlConnection ligar4 = new MySqlConnection(configuracao);
                MySqlCommand atualizar_produto = new MySqlCommand();
                atualizar_produto.Connection = ligar4;
                ligar4.Open();

                decimal preco = decimal.Parse(txt_preco.Text);
                string preco_ponto = preco.ToString(CultureInfo.GetCultureInfo("en-US").NumberFormat);

                atualizar_produto.CommandText = "Update produto set id_tipo_produto = @id_tipo_produto , preco = @preco, garantia = @garantia, descricao = @descricao, quantidade = @quantidade  where  id_produto = '" + codigo.ToString() + "'";
                atualizar_produto.Parameters.AddWithValue("@id_tipo_produto", ddl_categoria.SelectedValue);
                atualizar_produto.Parameters.AddWithValue("@preco", preco_ponto.ToString());
                atualizar_produto.Parameters.AddWithValue("@garantia", ddl_garantia.SelectedValue);
                atualizar_produto.Parameters.AddWithValue("@descricao", txt_desc.Text);
                atualizar_produto.Parameters.AddWithValue("@quantidade", txt_unidades.Text);
                try
                {
                    atualizar_produto.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    MessageBox.Show(erro.Message);
                }
                finally
                {
                    ligar4.Close();
                }

                MySqlConnection ligar6 = new MySqlConnection(configuracao);
                MySqlCommand atualizar_produto1 = new MySqlCommand();
                atualizar_produto1.Connection = ligar4;
                ligar4.Open();

                atualizar_produto1.CommandText = "Update modelo set desc_modelo = @id_modelo , id_marca = @marca where id_modelo = '" + codigo.ToString() + "'";

                atualizar_produto1.Parameters.AddWithValue("@id_modelo", txt_modelo.Text);
                atualizar_produto1.Parameters.AddWithValue("@marca", ddl_marca.SelectedValue);

                try
                {
                    atualizar_produto1.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    MessageBox.Show(erro.Message);
                }
                finally
                {
                    ligar6.Close();
                    Response.Redirect("Gerir_Produtos_Funcionario.aspx", false);
                }
            }
            if (flp_foto.HasFile == true)
            {
                string filename = System.IO.Path.GetFileName(flp_foto.FileName);
                flp_foto.SaveAs(Server.MapPath("img/") + filename);
                MySqlConnection ligar4 = new MySqlConnection(configuracao);
                MySqlCommand atualizar_produto = new MySqlCommand();
                atualizar_produto.Connection = ligar4;
                ligar4.Open();

                decimal preco = decimal.Parse(txt_preco.Text);
                string preco_ponto = preco.ToString(CultureInfo.GetCultureInfo("en-US").NumberFormat);

                atualizar_produto.CommandText = "Update produto set id_tipo_produto = @id_tipo_produto ,foto = @foto ,preco = @preco, garantia = @garantia, descricao = @descricao, quantidade = @quantidade  where  id_produto = '" + codigo.ToString() + "'";
                atualizar_produto.Parameters.AddWithValue("@id_tipo_produto", ddl_categoria.SelectedValue);
                atualizar_produto.Parameters.AddWithValue("@preco", preco_ponto.ToString());
                atualizar_produto.Parameters.AddWithValue("@garantia", ddl_garantia.SelectedValue);
                atualizar_produto.Parameters.AddWithValue("@descricao", txt_desc.Text);
                atualizar_produto.Parameters.AddWithValue("@quantidade", txt_unidades.Text);
                atualizar_produto.Parameters.AddWithValue("@foto", filename);
                try
                {
                    atualizar_produto.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    MessageBox.Show(erro.Message);
                }
                finally
                {
                    ligar4.Close();
                }

                MySqlConnection ligar6 = new MySqlConnection(configuracao);
                MySqlCommand atualizar_produto1 = new MySqlCommand();
                atualizar_produto1.Connection = ligar4;
                ligar4.Open();

                atualizar_produto1.CommandText = "Update modelo set desc_modelo = @id_modelo where id_modelo = '" + codigo.ToString() + "'";

                atualizar_produto1.Parameters.AddWithValue("@id_modelo", txt_modelo.Text);
                try
                {
                    atualizar_produto1.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    MessageBox.Show(erro.Message);
                }
                finally
                {
                    ligar6.Close();
                    Response.Redirect("Gerir_Produtos_Funcionario.aspx", false);
                }
            }
        }
    }
}