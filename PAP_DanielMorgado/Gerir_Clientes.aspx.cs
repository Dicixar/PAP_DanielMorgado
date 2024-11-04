using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Forms;

namespace PAP_DanielMorgado
{
    public partial class Gerir_Clientes : System.Web.UI.Page
    {   
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {
            RangeValidator1.MinimumValue = DateTime.Now.AddYears(-100).ToShortDateString();
            RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
        }

        protected void btn_atualizar_Click(object sender, EventArgs e)
        {
            
            int linha = dgv_grelha.SelectedIndex;
            string cod = dgv_grelha.Rows[linha].Cells[1].Text;
            MySqlConnection ligar2 = new MySqlConnection(configuracao);
            MySqlCommand editar_cliente = new MySqlCommand();
            editar_cliente.Connection = ligar2;
            ligar2.Open();

            editar_cliente.CommandText = "UPDATE cliente SET nome_cliente ='" + txt_nome.Text + "' , morada_cliente = '" + txt_morada.Text + "', codigo_postal = '" + txt_codigo.Text + "', NIF = '" + txt_nif.Text + "', data_nascimento_cliente = '" + txt_data.Text + "', contacto_cliente = '" + txt_contacto.Text + "' where id_cliente ='" + cod.ToString() + "'";

            try
            {
                editar_cliente.ExecuteNonQuery();
            }
            catch (Exception erro)
            {
                MessageBox.Show(erro.Message);
            }
            finally
            {
                ligar2.Close();
            }
            Response.Redirect("Gerir_Clientes.aspx", false);
        }

        protected void Unnamed1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_atualizar.Visible = true;
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            int linha = dgv_grelha.SelectedIndex;
            string cod = dgv_grelha.Rows[linha].Cells[1].Text;
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT nome_cliente, morada_cliente, codigo_postal, NIF, data_nascimento_cliente, contacto_cliente FROM cliente where id_cliente ='"+ cod.ToString() +"'";
            DR = comando.ExecuteReader();

            if (DR.Read())
            {
               
                txt_nome.Text = DR["nome_cliente"].ToString();
                txt_morada.Text = DR["morada_cliente"].ToString();
                txt_codigo.Text = DR["codigo_postal"].ToString();
                txt_nif.Text = DR["NIF"].ToString();
                txt_data.Text = (Convert.ToDateTime(DR["data_nascimento_cliente"]).ToString("yyyy-MM-dd"));
                txt_contacto.Text = DR["contacto_cliente"].ToString();

                ligar3.Close();
            }
        }
    }
}