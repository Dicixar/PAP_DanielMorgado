using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using MySql.Data.MySqlClient;

namespace PAP_DanielMorgado
{
    public partial class Gerir_Encomendas : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txt_texto_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btn_criar_Click(object sender, EventArgs e)
        {
            int linha = GridView1.SelectedIndex;
            string codigo = GridView1.Rows[linha].Cells[1].Text;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand inserir_modelo = new MySqlCommand();
            inserir_modelo.Connection = ligar;
            ligar.Open();

            inserir_modelo.CommandText = "UPDATE encomendas set id_situacao = '" + ddl_situacao.SelectedValue + "', id_funcionario = '" + ddl_funcionario.SelectedValue + "', data_entrega = '" + txt_data.Text + "' where id_encomenda = '" + codigo.ToString() + "'";
            if (Convert.ToDateTime(txt_data.Text) >= DateTime.Now)
            {
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
                    Response.Redirect("Gerir_Encomendas.aspx", false);
                }
            }
            else
            {
                MessageBox.Show("Data Inválida", "Aviso");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            btn_atualizar.Visible = true;
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            int linha = GridView1.SelectedIndex;
            string cod = GridView1.Rows[linha].Cells[1].Text;
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT id_situacao , id_funcionario, data_entrega from encomendas where id_encomenda = '" + cod.ToString() + "'";
            DR = comando.ExecuteReader();

            if (DR.Read())
            {
                ddl_situacao.SelectedValue = DR["id_situacao"].ToString() ;
                ddl_funcionario.SelectedValue = DR["id_funcionario"].ToString();
                if (DR["data_entrega"].ToString() == "")
                {

                }
                else
                {
                    txt_data.Text = (Convert.ToDateTime(DR["data_entrega"]).ToString("yyyy-MM-dd"));
                }
                GridView2.Visible = true;
                TextBox1.Text = cod.ToString();
                SqlDataSource2.SelectCommand = "SELECT modelo.desc_modelo, detalhe_encomenda.quantidade, detalhe_encomenda.valor FROM detalhe_encomenda INNER JOIN produto ON detalhe_encomenda.id_produto = produto.id_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo WHERE id_encomenda = '" + cod.ToString() + "'";


                ligar3.Close();
            }
        }
    }
}