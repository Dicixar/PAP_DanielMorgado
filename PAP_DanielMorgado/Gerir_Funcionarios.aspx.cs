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
    public partial class Gerir_Funcionarios : System.Web.UI.Page
    {
        
        string configuracao = "server=localhost;userid=root;database=loja";
        protected void Page_Load(object sender, EventArgs e)
        {
            RangeValidator1.MinimumValue = DateTime.Now.AddYears(-100).ToShortDateString();
            RangeValidator1.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
        }

        protected void btn_criar_Click(object sender, EventArgs e)
        {
            string filename = System.IO.Path.GetFileName(flp_foto.FileName);
            flp_foto.SaveAs(Server.MapPath("img/") + filename);
            MySqlConnection ligar = new MySqlConnection(configuracao);
            MySqlCommand inserir_login = new MySqlCommand();
            inserir_login.Connection = ligar;
            ligar.Open();

            inserir_login.CommandText = "Insert into login(email, password, id_tipo_login) values (@email, @password, 3)";

            inserir_login.Parameters.AddWithValue("@email", txt_email.Text);
            inserir_login.Parameters.AddWithValue("@password", txt_password.Text);
            try
            {
                inserir_login.ExecuteNonQuery();
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
            MySqlCommand inserir_funcionario = new MySqlCommand();
            inserir_funcionario.Connection = ligar2;
            ligar2.Open();

            inserir_funcionario.CommandText = "Insert into funcionario(nome_funcionario, morada_funcionario, codigo_postal, email, NIF, data_nascimento_funcionario, contacto_funcionario, horario, foto) values (@nome_funcionario, @morada_funcionario, @codigo_postal, @email, @NIF, @data_nascimento_funcionario, @contacto_funcionario, @horario, @foto)";
            inserir_funcionario.Parameters.AddWithValue("@nome_funcionario", txt_nome.Text);
            inserir_funcionario.Parameters.AddWithValue("@morada_funcionario", txt_morada.Text);
            inserir_funcionario.Parameters.AddWithValue("@codigo_postal", txt_codigo.Text);
            inserir_funcionario.Parameters.AddWithValue("@email", txt_email.Text);
            inserir_funcionario.Parameters.AddWithValue("@NIF", txt_nif.Text);
            inserir_funcionario.Parameters.AddWithValue("@data_nascimento_funcionario", txt_data.Text);
            inserir_funcionario.Parameters.AddWithValue("@contacto_funcionario", txt_contacto.Text);
            inserir_funcionario.Parameters.AddWithValue("@horario", ddl_horario.SelectedValue);
            inserir_funcionario.Parameters.AddWithValue("@foto", filename);
            try
            {
                inserir_funcionario.ExecuteNonQuery();
                MessageBox.Show("Funcionário Criado com Sucesso!!!", "Criar Funcionário");
                Response.Redirect("Gerir_Funcionarios.aspx", false);
            }
            catch (Exception erro)
            {
                MessageBox.Show(erro.Message);
            }
            finally
            {
                ligar2.Close();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_id.Visible = true;
            btn_atualizar.Visible = true;
            btn_eliminar.Visible = true;
            btn_criar.Visible = false;
            txt_password.Visible = false;
            txt_email.Visible = false;
            txt_data.Visible = false;
            txt_nif.Visible = false;
            flp_foto.Visible = false;
            RangeValidator1.Enabled = false;

            MySqlConnection ligar3 = new MySqlConnection(configuracao);
            int linha = dgv_grelha.SelectedIndex;
            string cod = dgv_grelha.Rows[linha].Cells[1].Text;
            MySqlDataReader DR;
            MySqlCommand comando = new MySqlCommand();
            comando.Connection = ligar3;
            ligar3.Open();
            comando.CommandText = "SELECT funcionario.id_funcionario, funcionario.nome_funcionario, funcionario.morada_funcionario, funcionario.codigo_postal, funcionario.email, login.password, funcionario.NIF, funcionario.data_nascimento_funcionario, funcionario.contacto_funcionario, funcionario.horario, funcionario.foto FROM funcionario INNER JOIN login ON funcionario.email = login.email where id_funcionario = '" + cod.ToString() + "'";
            DR = comando.ExecuteReader();

            if (DR.Read())
            {
                txt_id.Text = DR["id_funcionario"].ToString();
                txt_nome.Text = DR["nome_funcionario"].ToString();
                txt_morada.Text = DR["morada_funcionario"].ToString();
                txt_codigo.Text = DR["codigo_postal"].ToString();
                txt_email.Text = DR["email"].ToString();
                txt_password.Text = DR["password"].ToString();
                txt_nif.Text = DR["NIF"].ToString();
                txt_data.Text = DR["data_nascimento_funcionario"].ToString();
                txt_contacto.Text = DR["contacto_funcionario"].ToString();
                ddl_horario.SelectedValue = DR["horario"].ToString();

                ligar3.Close();
            }
        }

        protected void btn_atualizar_Click(object sender, EventArgs e)
        {
            string filename = System.IO.Path.GetFileName(flp_foto.FileName);
            flp_foto.SaveAs(Server.MapPath("img/") + filename);
            MySqlConnection ligar4 = new MySqlConnection(configuracao);
            MySqlCommand atualizar_funcionario = new MySqlCommand();
            atualizar_funcionario.Connection = ligar4;
            ligar4.Open();

            atualizar_funcionario.CommandText = "Update funcionario set nome_funcionario = @nome_funcionario , morada_funcionario = @morada_funcionario, codigo_postal = @codigo_postal, contacto_funcionario = @contacto_funcionario, horario = @horario where id_funcionario= @id_funcionario";
            atualizar_funcionario.Parameters.AddWithValue("@id_funcionario", txt_id.Text);
            atualizar_funcionario.Parameters.AddWithValue("@nome_funcionario", txt_nome.Text);
            atualizar_funcionario.Parameters.AddWithValue("@morada_funcionario", txt_morada.Text);
            atualizar_funcionario.Parameters.AddWithValue("@codigo_postal", txt_codigo.Text);
            atualizar_funcionario.Parameters.AddWithValue("@contacto_funcionario", txt_contacto.Text);
            atualizar_funcionario.Parameters.AddWithValue("@horario", ddl_horario.SelectedValue);
            try
            {
                atualizar_funcionario.ExecuteNonQuery();
            }
            catch (Exception erro)
            {
                MessageBox.Show(erro.Message);
            }
            finally
            {
                ligar4.Close();
            }
        }

        protected void btn_eliminar_Click(object sender, EventArgs e)
        {
                int linha = dgv_grelha.SelectedIndex;
                string codigo = dgv_grelha.Rows[linha].Cells[1].Text;

                MySqlConnection ligar5 = new MySqlConnection(configuracao);
                MySqlCommand apagar_funcionario = new MySqlCommand();
                apagar_funcionario.Connection = ligar5;
                ligar5.Open();
                apagar_funcionario.CommandText = "DELETE FROM funcionario WHERE id_funcionario = '" + codigo.ToString() + "'";
                try
                {
                    if (MessageBox.Show("Tem a Certeza que pretende eliminar o Funcionário: " + txt_nome.Text, "Eliminar Funcionário", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
                    {
                        apagar_funcionario.ExecuteNonQuery();
                    }
                    else
                    {
                        MessageBox.Show("Operação Cancelada!", "Eliminar Funcionário", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }

                }
                catch (Exception er)
                {
                    MessageBox.Show("Não pode Eliminar este funcionário porque está associado a uma encomenda!!!","Aviso");
                }
                ligar5.Close();

                dgv_grelha.SelectedIndex = -1;

                MySqlConnection ligar6 = new MySqlConnection(configuracao);
                MySqlCommand apagar_funcionario_login = new MySqlCommand();
                apagar_funcionario_login.Connection = ligar6;
                ligar6.Open();
                apagar_funcionario_login.CommandText = "DELETE FROM login WHERE email = '" + txt_email.Text + "'";
                try
                {
                    apagar_funcionario_login.ExecuteNonQuery();
                }
                catch (Exception erro)
                {
                    
                }
                finally
                {
                    ligar6.Close();
                    Response.Redirect("Gerir_Funcionarios.aspx", false);
                }


        }
        }
    }