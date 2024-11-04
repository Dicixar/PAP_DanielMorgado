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
    public partial class Componentes : System.Web.UI.Page
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

            //Motherboard
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 4";
            lbl_board.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //Grafica
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 1";
            lbl_placa.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //Processadores
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 5";
            lbl_proce.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //Ram
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 12";
            lbl_ram.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //SSD
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 10";
            lbl_ssd.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //HDD
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 11";
            lbl_hdd.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //Fonte
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 14";
            lbl_fonte.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //Caixa
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 7";
            lbl_caixa.Text = "( " + comando.ExecuteScalar().ToString() + " )";

            //Ventoinhas
            comando.CommandText = "Select Count(*) from produto where id_tipo_produto = 8";
            lbl_vent.Text = "( " + comando.ExecuteScalar().ToString() + " )";




            comando.CommandText = "Select Count(*) from modelo where id_marca = 4";
            lbl_amd.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 13";
            lbl_cooler.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 24";
            lbl_corsair.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 1";
            lbl_asus.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 17";
            lbl_evga.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 29";
            lbl_giga.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 27";
            lbl_intel.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 8";
            lbl_king.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 10";
            lbl_msi.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 3";
            lbl_nvidia.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 14";
            lbl_nzxt.Text = "( " + comando.ExecuteScalar().ToString() + " )";


            comando.CommandText = "Select Count(*) from modelo where id_marca = 9";
            lbl_skill.Text = "( " + comando.ExecuteScalar().ToString() + " )";


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

            comando.CommandText = "SELECT produto.id_produto, produto.preco, produto.foto, modelo.desc_modelo FROM produto INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN marca ON modelo.id_marca = marca.id_marca WHERE (produto.id_tipo_produto = 1 OR produto.id_tipo_produto = 4 OR produto.id_tipo_produto = 5 OR produto.id_tipo_produto = 7 OR produto.id_tipo_produto = 8 OR produto.id_tipo_produto = 10 OR produto.id_tipo_produto = 11 OR produto.id_tipo_produto = 12 OR produto.id_tipo_produto = 14)" + pesquisa + " AND produto.preco BETWEEN '" + Txt_min.Text + "' AND '" + Txt_max.Text + "'" + DropDownList1.SelectedValue;
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


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            TextBox id = ((TextBox)DataList1.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto.aspx");
        }

        protected void chk_placa_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_placa.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 1";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_board_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_board.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 4";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_proce_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_proce.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 5";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_ram_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_ram.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 12";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_ssd_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_ssd.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 10";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_hdd_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_hdd.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 11";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_fonte_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_fonte.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 14";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_caixa_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_caixa.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 7";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_vent_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_vent.Checked == true)
            {

                pesquisa = " AND produto.id_tipo_produto = 8";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_amd_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_amd.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 4";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_intel_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_intel.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 27";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_giga_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_giga.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 29";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_nvidia_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_nvidia.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 3";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_king_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_king.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 8";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_skill_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_skill.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 9";
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

        protected void chk_nzxt_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_nzxt.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 14";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_cooler_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_cooler.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 13";
                pesquisar();

            }
            else
            {
                pesquisa = "";
                pesquisar();
            }
        }

        protected void chk_evga_CheckedChanged(object sender, EventArgs e)
        {
            if (chk_evga.Checked == true)
            {

                pesquisa = " AND marca.id_marca = 17";
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