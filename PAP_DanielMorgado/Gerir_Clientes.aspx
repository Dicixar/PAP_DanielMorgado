<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Gerir_Clientes.aspx.cs" Inherits="PAP_DanielMorgado.Gerir_Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Clientes</h3>
						<ul class="breadcrumb-tree">
							<li><a href="HomeAdmin.aspx">Home</a></li>
							<li class="active">Gerir Clientes</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->
	<div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h3 class="tm-block-title d-inline-block">Gerir Clientes</h3>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                  
                 
				   <div class="form-group mb-3">
					  <label
                      for="name"
                      >Nome
                    </label>
					   <br />
					  <asp:TextBox ID="txt_nome" runat="server" TextMode="SingleLine" CssClass="cssdatxt" MaxLength="30" required="true" ></asp:TextBox>
                  </div>
                  <div class="form-group mb-3">
					  <label
                      for="name"
                      >Morada
                    </label>
					  <asp:TextBox ID="txt_morada" runat="server" TextMode="SingleLine" CssClass="cssdatxt" MaxLength="100"></asp:TextBox>
                  </div>
                  <div class="form-group mb-3">
					  <label
                      for="name"
                      >Codigo Postal
                    </label>
					  <asp:TextBox ID="txt_codigo" runat="server" TextMode="SingleLine" CssClass="cssdatxt" MaxLength="8" ValidationExpression=" [A-Z, a-z,0-9]{9}"></asp:TextBox>
                  </div>
				  <div class="form-group mb-3">
					  <label
                      for="name"
                      >NIF
                    </label>
					  <br />
					  <asp:TextBox ID="txt_nif" runat="server" TextMode="Number" CssClass="cssdatxt" MaxLength="9" ValidationExpression=" [A-Z, a-z,0-9]{9}"></asp:TextBox>
                  </div>
				  <div class="form-group mb-3">
					  <label
                      for="name"
                      >Data Nascimento
                    </label>
					  <asp:TextBox ID="txt_data" runat="server" TextMode="Date" CssClass="cssdatxt"></asp:TextBox>
					  <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="O Cliente não pode ter menos de 18 Anos!" ControlToValidate="txt_data" Type="Date"></asp:RangeValidator>
                  </div>
				  <div class="form-group mb-3">
					  <label
                      for="name"
                      >Contacto
                    </label>
					  <asp:TextBox ID="txt_contacto" runat="server" TextMode="Number" CssClass="cssdatxt" MaxLength="9"></asp:TextBox>
                  </div>
                  
                  <div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">

                  </div>
                    </div>
                      <div class="row">
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                        </div>
                  </div>

                  <div class="form-group mb-3">
					  <asp:Button ID="btn_atualizar" runat="server" Text="Editar" CssClass="primary-btn order-submit"  Visible="False" OnClick="btn_atualizar_Click" />
                  </div>

                  <div class="form-group mb-3">
                  </div>
                  <div class="form-group mb-3">    
                  </div>

                  
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                  <i
                   
                  ></i>
                </div>
                <div class="custom-file mt-3 mb-3">
					<div class="text-center">
					<asp:GridView runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_cliente" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ID="dgv_grelha" AutoGenerateSelectButton="True" OnSelectedIndexChanged="Unnamed1_SelectedIndexChanged" Height="155px" Width="775px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id_cliente" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_cliente" />
                            <asp:BoundField DataField="morada_cliente" HeaderText="Morada" SortExpression="morada_cliente" />
                            <asp:BoundField DataField="nome_cliente" HeaderText="Nome" SortExpression="nome_cliente" />
                            <asp:BoundField DataField="codigo_postal" HeaderText="Codigo Postal" SortExpression="codigo_postal" />
                            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                            <asp:BoundField DataField="NIF" HeaderText="NIF" SortExpression="NIF" />
                            <asp:BoundField DataField="data_nascimento_cliente" HeaderText="Data Nascimento" SortExpression="data_nascimento_cliente" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="contacto_cliente" HeaderText="Contacto" SortExpression="contacto_cliente" />
                            <asp:ImageField DataImageUrlField="foto" DataImageUrlFormatString="~/img/{0}" HeaderText="Foto">
								<ControlStyle Height="100px" Width="100px" />
                            </asp:ImageField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
					</div>
					<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT id_cliente, morada_cliente, nome_cliente, codigo_postal, email, NIF, data_nascimento_cliente, contacto_cliente, foto FROM cliente"></asp:SqlDataSource>
                </div>
              </div>
              <div class="col-12">
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer id="footer">
			<!-- top footer -->
			<div class="section">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Sobre Nós</h3>
								<ul class="footer-links">
									<li><a href="https://www.google.com/maps/dir//38.6671147,-8.9865251/@38.6667887,-8.9867981,622m/data=!3m1!1e3!4m2!4m1!3e0!5m1!1e4?hl=pt-PT"><i class="fa fa-map-marker"></i>Estrada do Esteiro Furado</a></li>
									<li><a href="#"><i class="fa fa-phone"></i>+351 931 938 478</a></li>
									<li><a href="https://mail.google.com/mail/u/1/#inbox?compose=GTvVlcRwQnVfGrNGVbrHQXTKlNswvdJmWNlvqhmGhcrgvWqLTfFLNBBgTzFJhNvhlHxxbbBMpSGSC"><i class="fa fa-envelope-o"></i>DanielMorgado@aemoita.com</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Categorias</h3>

							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Informação</h3>
								<ul class="footer-links">
									<li><a href="#">Sobre Nós</a></li>
									<li><a href="#">Politica de Privacidade</a></li>
									<li><a href="#">Termos e Condições</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Serviços</h3>

							</div>
						</div>
					</div>
					<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /top footer -->

			<!-- bottom footer -->
			<div id="bottom-footer" class="section">
				<div class="container">
					<!-- row -->
					<div class="row">
						<div class="col-md-12 text-center">
							<ul class="footer-payments">
								<li><a><i class="fa fa-cc-visa"></i></a></li>
								<li><a><i class="fa fa-credit-card"></i></a></li>
								<li><a><i class="fa fa-cc-paypal"></i></a></li>
								<li><a><i class="fa fa-cc-mastercard"></i></a></li>
								<li><a><i class="fa fa-cc-discover"></i></a></li>
								<li><a><i class="fa fa-cc-amex"></i></a></li>
							</ul>
							<span class="copyright">
								 Copyright ©2021 | Todos os Direitos Reservados
							</span>
						</div>
					</div>
						<!-- /row -->
				</div>
				<!-- /container -->
			</div>
			<!-- /bottom footer -->
		</footer>
		<!-- /FOOTER -->

		<!-- jQuery Plugins -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/slick.min.js"></script>
		<script src="js/nouislider.min.js"></script>
		<script src="js/jquery.zoom.min.js"></script>
		<script src="js/main.js"></script>
</asp:Content>
