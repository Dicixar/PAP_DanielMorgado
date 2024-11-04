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
    public partial class registo : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {
            RangeValidator1.MinimumValue = DateTime.Now.AddYears(-100).ToShortDateString();
            RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
        }

        protected void btn_registar_Click(object sender, EventArgs e)
        {
            if (chk_termos.Checked)
            {
                if (txt_pass.Text == txt_pass1.Text)
                {
                    MySqlConnection ligar = new MySqlConnection(configuracao);
                    MySqlCommand inserir_login = new MySqlCommand();
                    inserir_login.Connection = ligar;
                    ligar.Open();

                    inserir_login.CommandText = "Insert into login(email, password, id_tipo_login) values (@email, @password, 1)";

                    inserir_login.Parameters.AddWithValue("@email", txt_email.Text);
                    inserir_login.Parameters.AddWithValue("@password", txt_pass1.Text);
                    try
                    {
                        inserir_login.ExecuteNonQuery();
                        MessageBox.Show("Cliente Criado com Sucesso!", "Registo de Cliente",MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar.Close();
                    }

                    MySqlConnection ligar2 = new MySqlConnection(configuracao);
                    MySqlCommand inserir_cliente = new MySqlCommand();
                    inserir_cliente.Connection = ligar2;
                    ligar2.Open();

                    inserir_cliente.CommandText = "Insert into cliente(nome_cliente, email, data_nascimento_cliente) values (@nome_cliente, @email, @data_nascimento_cliente)";
                    inserir_cliente.Parameters.AddWithValue("@nome_cliente", txt_nome.Text);
                    inserir_cliente.Parameters.AddWithValue("@email", txt_email.Text);
                    inserir_cliente.Parameters.AddWithValue("@data_nascimento_cliente", txtDataNascimento.Text);
                    try
                    {
                        inserir_cliente.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar2.Close();
                    }
                    Response.Redirect("login.aspx", false);
                }
                else
                {
                    MessageBox.Show("Por favor introduza a mesma Password", "Erro");
                }
            }
            else
            {
                MessageBox.Show("Por favor aceite os termos e condições", "Erro");
            }
           
        }

        protected void txt_data_TextChanged(object sender, EventArgs e)
        {

        }
    }
}