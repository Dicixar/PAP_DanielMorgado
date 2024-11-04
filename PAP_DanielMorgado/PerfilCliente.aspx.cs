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
    public partial class PerfilCliente : System.Web.UI.Page
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
            select_nome.CommandText = "select nome_cliente from cliente where email='" + Session["email"] + "'";

            lbl_nome_perfil.Text = select_nome.ExecuteScalar().ToString();

            select_nome.CommandText = "select id_cliente from cliente where email='" + Session["email"] + "'";
            SqlDataSource1.SelectCommand = "SELECT encomendas.id_encomenda, encomendas.data_encomenda, encomendas.data_entrega, encomendas.valor_total, situacao.situacao FROM encomendas INNER JOIN situacao ON encomendas.id_situacao = situacao.id_situacao WHERE id_cliente= '" + select_nome.ExecuteScalar().ToString() + "'";

            
        }

        protected void btn_editar_Click(object sender, EventArgs e)
        {
            string nif = txt_NIF.Text;
            string contacto = txt_contacto.Text;
            if(nif.Length == 9 && contacto.Length == 9)
            {
                if (flp_foto.HasFile == false)
                {
                    MySqlConnection ligar3 = new MySqlConnection(configuracao);
                    MySqlCommand editar_login1 = new MySqlCommand();
                    editar_login1.Connection = ligar3;
                    ligar3.Open();

                    editar_login1.CommandText = " Update login set password = @password where email='" + txt_email.Text + "'";

                    editar_login1.Parameters.AddWithValue("@password", txt_pass.Text);
                    try
                    {
                        editar_login1.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar3.Close();
                    }

                    MySqlConnection ligar4 = new MySqlConnection(configuracao);
                    MySqlCommand editar_cliente1 = new MySqlCommand();
                    editar_cliente1.Connection = ligar4;
                    ligar4.Open();

                    editar_cliente1.CommandText = "UPDATE cliente SET nome_cliente ='" + txt_nome.Text + "' , morada_cliente = '" + txt_morada.Text + "', codigo_postal = '" + txt_codigo.Text + "', NIF = '" + txt_NIF.Text + "', data_nascimento_cliente = '" + txt_data.Text + "', contacto_cliente = '" + txt_contacto.Text + "' where id_cliente ='" + txt_id.Text + "'";

                    try
                    {
                        editar_cliente1.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar4.Close();
                    }
                    Response.Redirect("PerfilCliente.aspx", false);
                }
                else
                {
                    string filename = flp_foto.FileName;
                    flp_foto.SaveAs(Server.MapPath("img/") + filename);
                    MySqlConnection ligar = new MySqlConnection(configuracao);
                    MySqlCommand editar_login = new MySqlCommand();
                    editar_login.Connection = ligar;
                    ligar.Open();

                    editar_login.CommandText = " Update login set password = @password where email='" + txt_email.Text + "'";

                    editar_login.Parameters.AddWithValue("@password", txt_pass.Text);
                    try
                    {
                        editar_login.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar.Close();
                    }

                    MySqlConnection ligar2 = new MySqlConnection(configuracao);
                    MySqlCommand editar_cliente = new MySqlCommand();
                    editar_cliente.Connection = ligar2;
                    ligar2.Open();

                    editar_cliente.CommandText = "UPDATE cliente SET nome_cliente ='" + txt_nome.Text + "' , morada_cliente = '" + txt_morada.Text + "', codigo_postal = '" + txt_codigo.Text + "', NIF = '" + txt_NIF.Text + "', data_nascimento_cliente = '" + txt_data.Text + "', contacto_cliente = '" + txt_contacto.Text + "', foto = '" + filename + "' where id_cliente ='" + txt_id.Text + "'";

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
                    Response.Redirect("PerfilCliente.aspx", false);
                }
            }
            else
            {
                MessageBox.Show("NIF e/ou Contacto invalidos", "Aviso");
            }
            
        }

        protected void btn_editar_Click1(object sender, EventArgs e)
        {
            painel_encomendas.Visible = false;
            Painel_Detalhe.Visible = false;
            Image1.Visible = false;
            flp_foto.Visible = true;
            painel_perfil.Visible = true;
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT cliente.id_cliente, cliente.nome_cliente, cliente.morada_cliente, cliente.codigo_postal, login.email, login.password, cliente.NIF, cliente.data_nascimento_cliente, cliente.contacto_cliente, cliente.foto FROM cliente INNER JOIN login ON cliente.email = login.email where login.email ='" + Session["email"] + "' ";
            DR = comando.ExecuteReader();
            if (DR.Read())
            {
                lbl_nome_perfil.Text = DR["nome_cliente"].ToString();
                txt_id.Text = DR["id_cliente"].ToString();
                txt_nome.Text = DR["nome_cliente"].ToString();
                txt_morada.Text = DR["morada_cliente"].ToString();
                txt_codigo.Text = DR["codigo_postal"].ToString();
                txt_email.Text = DR["email"].ToString();
                txt_pass.Text = DR["password"].ToString();
                txt_NIF.Text = DR["NIF"].ToString();
                txt_data.Text = (Convert.ToDateTime(DR["data_nascimento_cliente"]).ToString("yyyy-MM-dd"));
                txt_contacto.Text = DR["contacto_cliente"].ToString();
                img_perfil.ImageUrl = "img/" + DR["foto"].ToString();



                ligar3.Close();
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx", false);
        }

        protected void txt_data_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
        
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int linha = GridView1.SelectedIndex;
            string cod = GridView1.Rows[linha].Cells[1].Text;
            Painel_Detalhe.Visible = true;
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT * from encomendas where id_encomenda = '" + cod + "'";
            DR = comando.ExecuteReader();
            if (DR.Read())
            {
                TextBox1.Text = Convert.ToString(cod);
                SqlDataSource2.SelectCommand = "SELECT modelo.desc_modelo, detalhe_encomenda.quantidade, detalhe_encomenda.valor FROM detalhe_encomenda INNER JOIN produto ON detalhe_encomenda.id_produto = produto.id_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo where id_encomenda = '" + TextBox1.Text + "'";
                



                ligar3.Close();
            }
            
        }

        protected void btn_fechar_Click(object sender, EventArgs e)
        {

            Response.Redirect("PerfilCliente.aspx", false);
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;


            if (MessageBox.Show("De certeza que deseja cancelar a encomenda ?", "Aviso", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                ligar3.Open();

                comando.CommandText = "Delete from detalhe_encomenda where id_encomenda =" + TextBox1.Text;
                comando.ExecuteNonQuery();


                comando.CommandText = "Delete from encomendas WHERE id_encomenda= " + TextBox1.Text;
                comando.ExecuteNonQuery();

                ligar3.Close();
            }
          
                Response.Redirect("PerfilCliente.aspx", false);
            
        }
    }
}