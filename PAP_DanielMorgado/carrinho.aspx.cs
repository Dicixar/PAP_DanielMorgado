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
    public partial class carrinho : System.Web.UI.Page
    {
        string configuracao = "server=localhost;userid=root;database=loja";
        decimal subtotal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(lbl_total.Text == "")
            {
                lbl_total.Text = "0";
            }
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand select_nome = new MySqlCommand();
            select_nome.Connection = ligar;

            ligar.Open();
            select_nome.CommandText = "select id_cliente from cliente where email='" + Session["email"] + "'";
            SqlDataSource1.SelectCommand = "SELECT modelo.desc_modelo, produto.preco, carrinho.quantidade FROM carrinho INNER JOIN produto ON carrinho.id_produto = produto.id_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo where id_cliente = '" + select_nome.ExecuteScalar().ToString() + "'";
            
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            System.Web.UI.WebControls.Label id = (System.Web.UI.WebControls.Label)(e.Item.FindControl("lbl_preco"));

            id.Text = Convert.ToString((decimal)DataBinder.Eval(e.Item.DataItem, "preco") * (int)DataBinder.Eval(e.Item.DataItem, "quantidade")) + "€";

            decimal _ = (decimal)DataBinder.Eval(e.Item.DataItem, "preco") * (int)DataBinder.Eval(e.Item.DataItem, "quantidade");

            subtotal += _;

            lbl_total.Text = subtotal.ToString();
        }

        protected void btn_encomendar_Click(object sender, EventArgs e)
        {
            
            if (CheckBox1.Checked)
            {
                MySqlConnection ligar1 = new MySqlConnection(configuracao);
                MySqlCommand select_nome = new MySqlCommand();
                select_nome.Connection = ligar1;

                ligar1.Open();
                select_nome.CommandText = "select id_cliente from cliente where email='" + Session["email"] + "'";
                int cliente = Convert.ToInt32(select_nome.ExecuteScalar());

                select_nome.CommandText = "SELECT COUNT(id_produto) from carrinho WHERE id_cliente = '" + cliente + "'";
                int quantcarrinho = Convert.ToInt32(select_nome.ExecuteScalar());
                
                
                
                if(quantcarrinho == 0)
                {
                    MessageBox.Show("O Carrinho esta vazio!", "Aviso");
                    Response.Redirect("carrinho.aspx", false);  
                }
                else
                {
                    MySqlConnection ligar = new MySqlConnection(configuracao);
                    MySqlCommand criar_encomenda = new MySqlCommand();
                    criar_encomenda.Connection = ligar;
                    ligar.Open();

                    criar_encomenda.CommandText = "Insert into encomendas(id_cliente,id_funcionario, data_encomenda,id_situacao,valor_total) values ('" + cliente + "', 3,'" + 
                        DateTime.Now.ToString("yyyy-MM-dd") + "', 5,'" + lbl_total.Text + "' )";

                    try
                    {
                        criar_encomenda.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar.Close();
                    }

                    ligar.Open();
                    MySqlCommand comando = new MySqlCommand();
                    comando.Connection = ligar;
                    comando.CommandText = "Select Max(id_encomenda) from encomendas";
                    int id = Convert.ToInt32(comando.ExecuteScalar());

                    comando.CommandText = "INSERT INTO detalhe_encomenda(id_encomenda, id_produto, quantidade, valor) SELECT '" + 
                        id + "', produto.id_produto, carrinho.quantidade, carrinho.quantidade*preco FROM carrinho,produto WHERE carrinho.id_produto = produto.id_produto AND carrinho.id_cliente=" + cliente;
                    try
                    {
                        comando.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar.Close();
                    }

                    ligar.Open();
                    MySqlCommand comando3 = new MySqlCommand();
                    comando3.Connection = ligar;
                    comando3.CommandText = "Select id_produto from detalhe_encomenda where id_encomenda = '" + id + "'";
                    int idproduto = Convert.ToInt32(comando3.ExecuteScalar());

                    comando3.CommandText = "Select quantidade from detalhe_encomenda where id_encomenda = '" + id + "'";
                    int quantidade = Convert.ToInt32(comando3.ExecuteScalar());

                    comando3.CommandText = "Update produto set quantidade = quantidade - '" + quantidade + "' WHERE id_produto ='" + idproduto + "'";
                    try
                    {
                        comando3.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar.Close();
                    }



                    ligar.Open();
                    MySqlCommand comando1 = new MySqlCommand();
                    comando1.Connection = ligar;
                    comando1.CommandText = "DELETE from carrinho where id_cliente ='" + cliente + "'"; 
                    try
                    {
                        comando1.ExecuteNonQuery();
                    }
                    catch (Exception erro)
                    {
                        MessageBox.Show(erro.Message);
                    }
                    finally
                    {
                        ligar.Close();
                        Response.Redirect("PerfilCliente.aspx", false);
                    }
                }
            }
                
            else
            {
                if(MessageBox.Show("Aceite os Termos e Condições", "Aviso", MessageBoxButtons.OK) == DialogResult.OK)
                {
                    Response.Redirect("carrinho.aspx", false);
                }
            }
        }

        protected void btn_limpar_Click(object sender, EventArgs e)
        {
            MySqlConnection ligar1 = new MySqlConnection(configuracao);
            ligar1.Open();
            MySqlCommand comando4 = new MySqlCommand();
            comando4.Connection = ligar1;

            comando4.CommandText = "Select id_cliente from cliente where email = '" + Session["email"] + "'";
            int id3 = Convert.ToInt32(comando4.ExecuteScalar());
            comando4.CommandText = "Delete from carrinho WHERE id_cliente ='" + id3 + "'";
            try
            {
                comando4.ExecuteNonQuery();
            }
            catch (Exception erro)
            {
                MessageBox.Show(erro.Message);
            }
            finally
            {
                ligar1.Close();
                Response.Redirect("carrinho.aspx", false);
            }
        }
    }
}