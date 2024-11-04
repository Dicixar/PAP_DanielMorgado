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
    public partial class Acessorios_Inicio : System.Web.UI.Page
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


                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 19";
                lbl_cam.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 18";
                lbl_head.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 17";
                lbl_mon.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 15";
                lbl_rato.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 13";
                lbl_sys.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 16";
                lbl_tec.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 1";
                lbl_asus.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 24";
                lbl_corsair.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 30";
                lbl_hyper.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 31";
                lbl_logi.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 21";
                lbl_mars.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 25";
                lbl_micro.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 20";
                lbl_razer.Text = "( " + comando.ExecuteScalar().ToString() + " )";


                comando.CommandText = "Select Count(*) from modelo where id_marca = 26";
                lbl_xi.Text = "( " + comando.ExecuteScalar().ToString() + " )";

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

            comando.CommandText = "SELECT produto.id_produto, produto.preco, produto.foto, modelo.desc_modelo FROM produto INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN marca ON modelo.id_marca = marca.id_marca WHERE (produto.id_tipo_produto = 15 OR produto.id_tipo_produto = 16 OR produto.id_tipo_produto = 17 OR produto.id_tipo_produto = 18 OR produto.id_tipo_produto = 19 OR produto.id_tipo_produto = 13)" + pesquisa + " AND produto.preco BETWEEN '" + Txt_min.Text + "' AND '" + Txt_max.Text + "'" + DropDownList1.SelectedValue;
            MySqlDataAdapter dados = new MySqlDataAdapter(comando);
            DataTable dt = new DataTable();
            dados.Fill(dt);

            DataList1.DataSource = dt;
            DataList1.DataBind();

            ligar.Close();
        }

        protected void chk_rato_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_rato.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 15";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_tec_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_tec.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 16";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_mon_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_mon.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 17";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_head_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_head.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 18";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_cam_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_cam.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 19";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_sys_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_sys.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 13";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_xi_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_xi.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 26";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_razer_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_razer.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 20";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_logi_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_logi.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 31";
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

        protected void chk_micro_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_micro.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 25";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_hyper_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_hyper.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 25";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_mars_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_mars.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 21";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_corsair_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_corsair.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 24";
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

            Response.Redirect("Produto_Inicio.aspx");
        }
    }
}