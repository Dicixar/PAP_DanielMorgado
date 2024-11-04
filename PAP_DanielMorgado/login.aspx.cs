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
    public partial class login : System.Web.UI.Page
    {
        string configura = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configura);
            Session["email"] = txt_email.Text;
            Session["password"] = txt_pass.Text;

            try
            {
                ligar.Open();
                MySqlCommand select_utilizador = new MySqlCommand("SELECT * from login where email=@email", ligar);
                select_utilizador.Parameters.AddWithValue("@email", txt_email.Text);
                var reader_utilizador = select_utilizador.ExecuteReader();

                if (!reader_utilizador.Read())
                {
                    MessageBox.Show("Erro: Email inválido.", "Email não registado", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
                reader_utilizador.Close();


                MySqlDataReader dr = select_utilizador.ExecuteReader();

                while (dr.Read())
                {
                    string email = dr.GetString("email");
                    string pass = dr.GetString("password");

                    int tipo_utilizador = dr.GetInt16("id_tipo_login");

                    if (email == txt_email.Text && pass == txt_pass.Text)
                    {
                        if (tipo_utilizador == 1)
                        {
                            Session["email"] = txt_email.Text;
                            Response.Redirect("HomeCliente.aspx", false);
                        }

                        else if (tipo_utilizador == 2)
                        {
                            Session["email"] = txt_email.Text;
                            Response.Redirect("HomeAdmin.aspx", false);
                        }

                        else if (tipo_utilizador == 3)
                        {
                            Session["email"] = txt_email.Text;
                            Response.Redirect("HomeFuncionario.aspx", false);
                        }

                    }
                    else
                    {
                        MessageBox.Show("Erro: Password inválida.", "Password não corresponde ao Email", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
            }
            catch (Exception er)
            {
                MessageBox.Show(er.Message);
            }
            finally
            {
                ligar.Close();
            }
            Session["email"] = txt_email.Text;
        }
    }
}