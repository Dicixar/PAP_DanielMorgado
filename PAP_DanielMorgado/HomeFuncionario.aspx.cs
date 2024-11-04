using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;


namespace PAP_DanielMorgado
{
    public partial class HomeFuncionario : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand select_nome = new MySqlCommand();
            select_nome.Connection = ligar;

            ligar.Open();
            select_nome.CommandText = "select nome_funcionario from funcionario where email='" + Session["email"] + "'";

            Label1.Text = select_nome.ExecuteScalar().ToString();
        }
    }
}