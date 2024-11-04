using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Windows.Forms;
using System.IO;
using System.Data;

namespace PAP_DanielMorgado
{
    public partial class Produto_Inicio : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT produto.quantidade, produto.id_produto, produto.id_tipo_produto, tipo_produto.descricao_produto, modelo.desc_modelo, produto.preco, produto.foto, produto.garantia, produto.descricao, produto.quantidade FROM produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto where id_produto = '" + Session["id_produto"] + "'";
            //comando.CommandText = "SELECT produto.id_produto, tipo_produto.descricao_produto, modelo.desc_modelo, produto.preco, produto.foto, produto.garantia, produto.descricao, produto.quantidade FROM produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto where id_produto = 1";
            DR = comando.ExecuteReader();
            if (DR.Read())
            {
                lbl_nome.Text = DR["desc_modelo"].ToString();
                lbl_categoria.Text = DR["descricao_produto"].ToString();
                lbl_descricao.Text = DR["descricao"].ToString();
                lbl_preco.Text = DR["preco"].ToString();
                Image1.ImageUrl = "img/" + DR["foto"].ToString();
                Image2.ImageUrl = "img/" + DR["foto"].ToString();
                lbl_tipo.Text = DR["id_tipo_produto"].ToString();
                lbl_quant.Text = DR["quantidade"].ToString();




                ligar3.Close();
            }
            MySqlConnection ligar5 = new MySqlConnection(configuracao);
            MySqlDataReader DR2;
            MySqlCommand comando2 = new MySqlCommand();
            comando2.Connection = ligar5;
            ligar5.Open();
            comando2.CommandText = "SELECT id_tipo_produto from tipo_produto where descricao_produto = '" + lbl_categoria.Text + "'";
            DR2 = comando2.ExecuteReader();
            if (DR2.Read())
            {
                lbl_id_cat.Text = DR2["id_tipo_produto"].ToString();

                ligar5.Close();
            }

            SqlDataSource1.SelectCommand = "SELECT produto.preco, produto.foto, modelo.desc_modelo, produto.id_produto FROM produto INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN marca ON modelo.id_marca = marca.id_marca WHERE produto.id_tipo_produto = '" + lbl_id_cat.Text + "'";

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            System.Web.UI.WebControls.TextBox id = ((System.Web.UI.WebControls.TextBox)DataList1.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto_Inicio.aspx");
        }
    }
}