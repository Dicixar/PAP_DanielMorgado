using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PAP_DanielMorgado
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["email"] = "";
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList1.SelectedIndex = e.Item.ItemIndex;
            TextBox id = ((TextBox)DataList1.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto_Inicio.aspx");
        }

        protected void DataList5_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList5.SelectedIndex = e.Item.ItemIndex;
            TextBox id = ((TextBox)DataList5.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto_Inicio.aspx");
        }

        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList2.SelectedIndex = e.Item.ItemIndex;
            TextBox id = ((TextBox)DataList2.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto_Inicio.aspx");
        }

        protected void DataList3_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList3.SelectedIndex = e.Item.ItemIndex;
            TextBox id = ((TextBox)DataList3.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto_Inicio.aspx");
        }

        protected void DataList4_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DataList4.SelectedIndex = e.Item.ItemIndex;
            TextBox id = ((TextBox)DataList4.SelectedItem.FindControl("txt_ID"));
            Session["id_produto"] = id.Text;

            Response.Redirect("Produto_Inicio.aspx");
        }
    }
}