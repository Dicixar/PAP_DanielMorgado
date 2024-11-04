<%@ Page Title="" Language="C#" MasterPageFile="~/MasterLogin.Master" AutoEventWireup="true" CodeBehind="registo.aspx.cs" Inherits="PAP_DanielMorgado.registo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<span class="login100-form-title p-b-26">
						Bem Vindo!
					</span>
					<span class="login100-form-title p-b-48">
						<a href="Inicio.aspx">
							<img src="img/logo_branco.png" alt="" width="150">
						</a>
					</span>

					<div class="wrap-input100 validate-input">
						<asp:TextBox ID="txt_nome" placeholder="Insira o Nome" runat="server" required="true"></asp:TextBox>
				
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<asp:TextBox ID="txt_email" TextMode="Email" placeholder="Insira o Email" runat="server" required="true"></asp:TextBox>
				
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<asp:TextBox ID="txt_pass" TextMode="Password" placeholder="Insira a Password" runat="server"></asp:TextBox>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Repeat password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<asp:TextBox ID="txt_pass1" TextMode="Password" placeholder="Repita a Password" runat="server"></asp:TextBox>
					</div>

					<div class="wrap-input100 validate-input">
						<asp:TextBox ID="txtDataNascimento" placeholder="Insira a data de nascimento" runat="server" required="true" TextMode="Date"></asp:TextBox>
					</div>
						<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Tem de ser maior de 18 anos para registar!" Type="Date" ControlToValidate="txtDataNascimento"></asp:RangeValidator>
					<div class="form-group">
                                <br />
                                <asp:CheckBox ID="chk_termos" runat="server" CausesValidation="True"/>
                                <label for="agree-term" class="label-agree-term">Eu aceito todos os <a href="#" class="term-service">Termos De Serviço</a></label>
                    </div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<asp:Button ID="btn_registar" runat="server" Text="Registar" CssClass="login100-form-btn" BackColor="#627ed4" OnClick="btn_registar_Click" />
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							Já tem uma conta?
						</span>

						<a class="txt2" href="login.aspx">
							Login
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
</asp:Content>
