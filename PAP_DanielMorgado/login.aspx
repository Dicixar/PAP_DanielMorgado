<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLogin.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="PAP_DanielMorgado.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Bem-Vindo!
					</span>
					<span class="login100-form-title p-b-48">
						<a href="Inicio.aspx">
							<img src="img/logo_branco.png" alt="" width="150">
						</a>
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<asp:TextBox ID="txt_email" placeholder="Insira o Email" runat="server"></asp:TextBox>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<asp:TextBox ID="txt_pass" TextMode="Password" placeholder="Insira a Password" runat="server"></asp:TextBox>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<asp:Button ID="btn_login" runat="server" Text="Login" CssClass="login100-form-btn" BackColor="#627ed4" OnClick="btn_login_Click" />
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							Não tem uma Conta?
						</span>

						<a class="txt2" href="registo.aspx">
							Registar
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</asp:Content>
