using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.IO;
using System.Data;

namespace PAP_DanielMorgado
{
    public partial class Computadores : System.Web.UI.Page
    {
        string pesquisa;
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MySqlConnection ligar3 = new MySqlConnection(configuracao);
                MySqlCommand comando = new MySqlCommand();
                comando.Connection = ligar3;
                ligar3.Open();

                //ChromeBooks
                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 9";
                lbl_chromebooks.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Desktop
                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 3";
                lbl_desktop.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Portateis
                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 2";
                lbl_portatil.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Samsung
                comando.CommandText = "Select Count(*) from modelo where id_marca = 22";
                lbl_samsung.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //LG
                comando.CommandText = "Select Count(*) from modelo where id_marca = 23";
                lbl_lg.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Toshiba
                comando.CommandText = "Select Count(*) from modelo where id_marca = 19";
                lbl_toshiba.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Asus
                comando.CommandText = "Select Count(*) from modelo where id_marca = 1";
                lbl_asus.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //HP
                comando.CommandText = "Select Count(*) from modelo where id_marca = 2";
                lbl_hp.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Lenovo
                comando.CommandText = "Select Count(*) from modelo where id_marca = 5";
                lbl_lenovo.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //ROG
                comando.CommandText = "Select Count(*) from modelo where id_marca = 6";
                lbl_rog.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Omen
                comando.CommandText = "Select Count(*) from modelo where id_marca = 7";
                lbl_omen.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //MSI
                comando.CommandText = "Select Count(*) from modelo where id_marca = 10";
                lbl_msi.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Apple
                comando.CommandText = "Select Count(*) from modelo where id_marca = 15";
                lbl_apple.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                //Acer
                comando.CommandText = "Select Count(*) from modelo where id_marca = 18";
                lbl_acer.Text = "( " + comando.ExecuteScalar().ToString() + " )";

                ligar3.Close();

                pesquisar();

            }
        }


        void pesquisar()
        {
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();

            comando.Connection = ligar;

            ligar.Open();

            comando.CommandText = "SELECT produto.id_produto, produto.preco, produto.foto, modelo.desc_modelo FROM produto INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN marca ON modelo.id_marca = marca.id_marca WHERE (produto.id_tipo_produto = 2 OR produto.id_tipo_produto = 3 OR produto.id_tipo_produto = 9)" + pesquisa + " AND produto.preco BETWEEN '" + Txt_min.Text + "' AND '" + Txt_max.Text + "'" + DropDownList1.SelectedValue;
            MySqlDataAdapter dados = new MySqlDataAdapter(comando);
            DataTable dt = new DataTable();
            dados.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();

            ligar.Close();
        }

        protected void DataList1_Load(object sender, EventArgs e)
        {
            
        }

        protected void chk_portatil_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_portatil.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 2";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_desktop_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_desktop.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 3";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_chrome_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_chrome.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 9";
                pesquisar();

            }
            else
            {
                pesquisa = "";  
                pesquisar();
            }
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            TextBox id = ((TextBox)DataList1.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto.aspx");
        }

        protected void DataList1_PreRender(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            
        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        protected void chk_samsung_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_samsung.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 22";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_lg_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_lg.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 23";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_toshiba_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_toshiba.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 19";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_asus_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_asus.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 1";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_hp_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_hp.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 2";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_lenovo_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_lenovo.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 5";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_rog_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_rog.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 6";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_omen_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_omen.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 7";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_msi_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_msi.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 10";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_apple_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_apple.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 15";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_acer_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_acer.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 18";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }
    }
}