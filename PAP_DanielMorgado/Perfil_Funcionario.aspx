<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFuncionario.Master" AutoEventWireup="true" CodeBehind="Perfil_Funcionario.aspx.cs" Inherits="PAP_DanielMorgado.Perfil_Funcionario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
<div class="container">
    <div class="main-body"> 
          <div class="row gutters-sm">
            <div class="col-md-4 mb-3">
              <div class="card">
                <div class="card-body">
                  <div class="d-flex flex-column align-items-center text-center">
                    <asp:Image ID="img_perfil" runat="server" Width="150"/>

                    <div class="mt-3">
                      <h4><asp:Label runat="server" Text="Label" ID="lbl_nome_perfil"></asp:Label></h4>
                      <p class="text-secondary mb-1"></p>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/img/utilizador.png" Width="150px" />
                        <asp:FileUpload ID="flp_foto" runat="server" Visible="False" />
                      <p class="text-muted font-size-sm"></p>
                        <asp:Button ID="btn_editar" runat="server" Text="Editar" OnClick="btn_editar_Click1" CssClass="btn btn-primary"/>
                        <asp:Button ID="btn_logout" runat="server" Text="Logout" CssClass="btn btn-primary" OnClick="btn_logout_Click"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card mt-3">
              </div>
            </div>
              <asp:Panel ID="painel_perfil" runat="server" Visible="false">
                  <div class="col-md-8">
              <div class="card mb-3">
                <div class="card-body">
                  <div class="row">
                      <h3 class="text-center">Complete o Seu Perfil</h3>
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <asp:TextBox ID="txt_email" TextMode="Email" runat="server" CssClass="cssdatxt" Visible="false" ></asp:TextBox>
                      <asp:TextBox ID="txt_id" TextMode="SingleLine" runat="server"  CssClass="cssdatxt" Visible="false"></asp:TextBox>
                    </div>
                  </div>
                  <hr>
                    <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Nome</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <asp:TextBox ID="txt_nome" TextMode="SingleLine" runat="server" CssClass="cssdatxt" required="true" MaxLength="30"></asp:TextBox>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Morada</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <asp:TextBox ID="txt_morada" TextMode="SingleLine" runat="server" CssClass="cssdatxt" MaxLength="100"></asp:TextBox>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Código Postal</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <asp:TextBox ID="txt_codigo" TextMode="SingleLine" runat="server" CssClass="cssdatxt" MaxLength="8"></asp:TextBox>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">NIF</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                      <asp:TextBox ID="txt_NIF" TextMode="SingleLine" runat="server" CssClass="cssdatxt" MaxLength="9"></asp:TextBox>
                        <br />
                        </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Data de Nascimento</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <asp:TextBox ID="txt_data" TextMode="Date" runat="server" CssClass="cssdatxt"></asp:TextBox>
                        <br />
						<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Tem de ser maior que 18 anos" Type="Date" ControlToValidate="txt_data"></asp:RangeValidator>
                    </div>
                  </div>
                   <hr>
                    <div class="row">
                    <div class="col-sm-3">
                      <h6 class="mb-0">Contacto</h6>
                    </div>
                    <div class="col-sm-9 text-secondary">
                        <asp:TextBox ID="txt_contacto" TextMode="SingleLine" runat="server" CssClass="cssdatxt" MaxLength="9"></asp:TextBox>
                    </div>
                  </div>
                  <hr>
                  <div class="row">
                    <div class="col-sm-12">
                      <asp:Button ID="btn_editar_perfil" runat="server" Text="Editar" CssClass="btn btn-info" OnClick="btn_editar_Click"/>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
    </div>
              </asp:Panel>

<style type="text/css">
body{
    margin-top:20px;
    color: #1a202c;
    text-align: left;
    background-color: #e2e8f0;    
}
.main-body {
    padding: 15px;
}
.card {
    box-shadow: 0 1px 3px 0 rgba(0,0,0,.1), 0 1px 2px 0 rgba(0,0,0,.06);
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 0 solid rgba(0,0,0,.125);
    border-radius: .25rem;
}

.card-body {
    flex: 1 1 auto;
    min-height: 1px;
    padding: 1rem;
}

.gutters-sm {
    margin-right: -8px;
    margin-left: -8px;
}

.gutters-sm>.col, .gutters-sm>[class*=col-] {
    padding-right: 8px;
    padding-left: 8px;
}
.mb-3, .my-3 {
    margin-bottom: 1rem!important;
}

.bg-gray-300 {
    background-color: #e2e8f0;
}
.h-100 {
    height: 100%!important;
}
.shadow-none {
    box-shadow: none!important;
}
</style>

<script type="text/javascript">

</script>
</body>
</asp:Content>
