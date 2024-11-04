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
    public partial class MasterCliente : System.Web.UI.MasterPage
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        decimal subtotal;

        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand select_nome = new MySqlCommand();
            select_nome.Connection = ligar;

            ligar.Open();
            select_nome.CommandText = "select nome_cliente from cliente where email='" + Session["email"] + "'";

            Label1.Text = select_nome.ExecuteScalar().ToString();

            select_nome.CommandText = "select id_cliente from cliente where email='" + Session["email"] + "'";


            SqlDataSource1.SelectCommand = "SELECT modelo.desc_modelo, produto.preco, carrinho.quantidade, produto.foto FROM carrinho INNER JOIN produto ON carrinho.id_produto = produto.id_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo WHERE carrinho.id_cliente = '" + select_nome.ExecuteScalar().ToString() + "'";

            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar;

            comando.CommandText = "SELECT SUM(quantidade) FROM carrinho where id_cliente = '" + select_nome.ExecuteScalar().ToString() + "'";

            lbl_quantidade_carrinho.Text = comando.ExecuteScalar().ToString();

            ligar.Close();
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            System.Web.UI.WebControls.Label id = (System.Web.UI.WebControls.Label)(e.Item.FindControl("lbl_preco"));

            id.Text = Convert.ToString((decimal)DataBinder.Eval(e.Item.DataItem, "preco") * (int)DataBinder.Eval(e.Item.DataItem, "quantidade")) + "€";

            decimal _ = (decimal)DataBinder.Eval(e.Item.DataItem, "preco") * (int)DataBinder.Eval(e.Item.DataItem, "quantidade");

            subtotal += _;

            lbl_total.Text = subtotal.ToString();
        }
    }
}