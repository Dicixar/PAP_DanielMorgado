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
    public partial class Gerir_Marcas : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            btn_criar.Visible = false;
            btn_eliminar.Visible = true;
            MySqlConnection ligar = new MySqlConnection(configuracao);
            int linha = GridView1.SelectedIndex;
            string cod = GridView1.Rows[linha].Cells[1].Text;
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar;
            ligar.Open();
            comando.CommandText = "SELECT marca from marca where id_marca = '" + cod.ToString() + "'";
            DR = comando.ExecuteReader();

            if (DR.Read())
            {
                Txt_marca.Text = DR["marca"].ToString();
 

                ligar.Close();
            }
        }
    }
}