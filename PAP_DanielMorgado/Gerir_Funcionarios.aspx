   <%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Gerir_Funcionarios.aspx.cs" Inherits="PAP_DanielMorgado.Gerir_Funcionarios" %>
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
						<h3 class="breadcrumb-header">Funcionários</h3>
						<ul class="breadcrumb-tree">
							<li><a href="HomeAdmin.aspx">Home</a></li>
							<li class="active">Funcionários</li>
						</ul>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-7">
						<!-- Billing Details -->
						<div class="billing-details">
							<div class="section-title">
								<h3 class="title">Insira Os Dados</h3>
							</div>
									<div class="form-group">
										<asp:TextBox ID="txt_id" placeholder="Numero de Identificação" runat="server" required="true" CssClass="cssdatxt" Enabled="false" Visible="False"></asp:TextBox>
									</div>
									<div class="form-group">
										<asp:TextBox ID="txt_nome" placeholder="Nome" runat="server" required="true" CssClass="cssdatxt" MaxLength="50"></asp:TextBox>
									</div>
									<div class="form-group">
										<asp:TextBox ID="txt_morada" placeholder="Morada" runat="server" required="true" CssClass="cssdatxt" MaxLength="100"></asp:TextBox>
									</div>
									<div class="form-group">
									    <asp:TextBox ID="txt_codigo" placeholder="Código Postal" runat="server" required="true" CssClass="cssdatxt" MaxLength="8"></asp:TextBox>
									</div>
									<div class="form-group">
										<asp:TextBox ID="txt_email" TextMode="Email" placeholder="Email" runat="server" required="true" CssClass="cssdatxt" MaxLength="50"></asp:TextBox>
									</div>
									<div class="form-group">
										<asp:TextBox ID="txt_password" TextMode="Password" placeholder="Password" runat="server" required="true" CssClass="cssdatxt"></asp:TextBox>
									</div>
									<div class="form-group">
										<asp:TextBox ID="txt_nif" placeholder="NIF" runat="server" required="true" CssClass="cssdatxt" MaxLength="9"></asp:TextBox>
									</div>
									<div class="form-group">
										<asp:TextBox ID="txt_data" TextMode="Date" runat="server" required="true" CssClass="cssdatxt"></asp:TextBox>
										<asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Tem de ser maior que 18 anos" Type="Date" ControlToValidate="txt_data"></asp:RangeValidator>
									</div>
									<div class="form-group">
										<asp:TextBox ID="txt_contacto" placeholder="Contacto" runat="server" required="true" CssClass="cssdatxt" MaxLength="9"></asp:TextBox>
									</div>
									<div class="form-group">
										<asp:DropDownList ID="ddl_horario" runat="server" CssClass="cssdatxt">
                                            <asp:ListItem Selected="True">Selecione um Horário</asp:ListItem>
                                            <asp:ListItem>08:00-16:00</asp:ListItem>
                                            <asp:ListItem>13:00-20:00</asp:ListItem>
                                        </asp:DropDownList>
									</div>
									<div class="form-group">
										<asp:FileUpload ID="flp_foto" runat="server" required="true" />
									</div>
						</div>
						<!-- /Billing Details -->

						<!-- Shiping Details -->
						<div class="shiping-details">
							<div class="section-title">
								<asp:Button ID="btn_criar" runat="server" Text="Criar" CssClass="primary-btn order-submit" OnClick="btn_criar_Click"/>
								<asp:Button ID="btn_atualizar" runat="server" Text="Atualizar" CssClass="primary-btn order-submit" OnClick="btn_atualizar_Click" Visible="False"/>
								<asp:Button ID="btn_eliminar" runat="server" Text="Eliminar" CssClass="primary-btn order-submit" OnClick="btn_eliminar_Click" CausesValidation="False" Visible="False"/>
							</div>
							<div class="input-checkbox">
								
								<label for="shiping-address">
									<span></span>
								</label>
								<div class="caption">
								</div>
							</div>
						</div>
						<!-- /Shiping Details -->

						<!-- Order notes -->
						<div class="order-notes">
						</div>
						<!-- /Order notes -->
					</div>

					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Funcionários</h3>
						</div>
						<div class="order-summary">
								<asp:GridView ID="dgv_grelha" runat="server" CellPadding="4" DataSourceID="Funcionarios" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="id_funcionario" Width="451px" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="id_funcionario" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_funcionario" />
                                        <asp:BoundField DataField="nome_funcionario" HeaderText="Nome" SortExpression="nome_funcionario" />
                                        <asp:ImageField DataImageUrlField="foto" DataImageUrlFormatString="~/img/{0}" HeaderText="Foto">
											<ControlStyle Height="100px" Width="150px" />
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
						        <asp:SqlDataSource ID="Funcionarios" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT id_funcionario, nome_funcionario, foto FROM funcionario"></asp:SqlDataSource>
						</div>
						<div class="payment-method">
						</div>
					</div>
					<!-- /Order Details -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->
		<!-- FOOTER -->
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

	</body>
</asp:Content>
