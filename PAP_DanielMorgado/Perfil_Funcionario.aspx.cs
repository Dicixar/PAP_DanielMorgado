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
    public partial class Perfil_Funcionario : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {
            RangeValidator1.MinimumValue = DateTime.Now.AddYears(-100).ToShortDateString();
            RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand select_nome = new MySqlCommand();
            select_nome.Connection = ligar;

            ligar.Open();
            select_nome.CommandText = "select nome_funcionario from funcionario where email='" + Session["email"] + "'";

            lbl_nome_perfil.Text = select_nome.ExecuteScalar().ToString();
        }

        protected void btn_editar_Click1(object sender, EventArgs e)
        {
            Image1.Visible = false;
            flp_foto.Visible = true;
            painel_perfil.Visible = true;
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT * FROM funcionario where email ='" + Session["email"] + "' ";
            DR = comando.ExecuteReader();
            if (DR.Read())
            {
                lbl_nome_perfil.Text = DR["nome_funcionario"].ToString();
                txt_id.Text = DR["id_funcionario"].ToString();
                txt_nome.Text = DR["nome_funcionario"].ToString();
                txt_morada.Text = DR["morada_funcionario"].ToString();
                txt_codigo.Text = DR["codigo_postal"].ToString();
                txt_email.Text = DR["email"].ToString();
                txt_NIF.Text = DR["NIF"].ToString();
                txt_data.Text = (Convert.ToDateTime(DR["data_nascimento_funcionario"]).ToString("yyyy-MM-dd"));
                txt_contacto.Text = DR["contacto_funcionario"].ToString();
                img_perfil.ImageUrl = "img/" + DR["foto"].ToString();



                ligar3.Close();
            }
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            if (flp_foto.HasFile == true)
            {
                string filename = flp_foto.FileName;
                flp_foto.SaveAs(Server.MapPath("img/") + filename);
                MySqlConnection ligar2 = new MySqlConnection(configuracao);
                MySqlCommand editar_cliente = new MySqlCommand();
                editar_cliente.Connection = ligar2;
                ligar2.Open();

                editar_cliente.CommandText = "UPDATE funcionario SET nome_funcionario ='" + txt_nome.Text + "' , morada_funcionario = '" + txt_morada.Text + "', codigo_postal = '" + txt_codigo.Text + "', NIF = '" + txt_NIF.Text + "', data_nascimento_funcionario = '" + txt_data.Text + "', contacto_funcionario = '" + txt_contacto.Text + "', foto = '" + filename + "' where id_funcionario ='" + txt_id.Text + "'";

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
                Response.Redirect("Perfil_Funcionario.aspx", false);
            }
            else
            {
                MySqlConnection ligar3 = new MySqlConnection(configuracao);
                MySqlCommand editar_funcionario1 = new MySqlCommand();
                editar_funcionario1.Connection = ligar3;
                ligar3.Open();

                editar_funcionario1.CommandText = "UPDATE funcionario SET nome_funcionario ='" + txt_nome.Text + "' , morada_funcionario = '" + txt_morada.Text + "', codigo_postal = '" + txt_codigo.Text + "', NIF = '" + txt_NIF.Text + "', data_nascimento_funcionario = '" + txt_data.Text + "', contacto_funcionario = '" + txt_contacto.Text + "' where id_funcionario ='" + txt_id.Text + "'";

                try
                {
                    editar_funcionario1.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    MessageBox.Show(erro.Message);
                }
                finally
                {
                    ligar3.Close();
                }
                Response.Redirect("Perfil_Funcionario.aspx", false);
            }

        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx", false);
        }
    }
}