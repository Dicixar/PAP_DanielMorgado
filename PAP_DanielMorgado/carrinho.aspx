<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCliente.Master" AutoEventWireup="true" CodeBehind="carrinho.aspx.cs" Inherits="PAP_DanielMorgado.carrinho" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- BREADCRUMB -->
		<div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<h3 class="breadcrumb-header">Finalizar</h3>
						<ul class="breadcrumb-tree">
							<li><a href="HomeCliente.aspx">Home</a></li>
							<li class="active">Finalizar Encomenda</li>
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
							<%--<div class="section-title">
								<h3 class="title"></h3>
							</div>
							<div class="form-group">
								
							</div>
							<div class="form-group">
								
							</div>
							<div class="form-group">
								
							</div>
							<div class="form-group">
								
							</div>
							<div class="form-group">
								
							</div>
							<div class="form-group">
								
							</div>
							<div class="form-group">
								<div class="input-checkbox">
								</div>--%>
							</div>
						</div>
					</div>
						<!-- /Billing Details -->

					<!-- Order Details -->
					<div class="col-md-5 order-details">
						<div class="section-title text-center">
							<h3 class="title">Sua Encomenda</h3>
						</div>
						<div class="order-summary">
							<div class="order-col">
								<div><strong>Produto</strong></div>
								<div><strong>Total</strong></div>
							</div>
							<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" OnItemDataBound="DataList1_ItemDataBound">
								<ItemTemplate>
									<div class="order-products">
								<div class="order-col">
									<div><asp:Label ID="lbl_quantidade" runat="server" Text='<%# Eval("quantidade") %>'></asp:Label> <asp:Label ID="lbl_nome" runat="server" Text='<%# Eval("desc_modelo") %>'></asp:Label></div>
									<div><asp:Label ID="lbl_preco" runat="server" Text=""></asp:Label></div>
								</div>
							</div>
								</ItemTemplate>
							</asp:DataList><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT modelo.desc_modelo, produto.preco, carrinho.quantidade FROM carrinho INNER JOIN produto ON carrinho.id_produto = produto.id_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo"></asp:SqlDataSource>
							<div class="order-col">
								<div>Portes de Envio</div>
								<div><strong>Grátis</strong></div>
							</div>
							<div class="order-col">
								<div><strong>Total</strong></div>
								<div><strong class="order-total"><asp:Label ID="lbl_total" runat="server" Text=""></asp:Label>€</strong></div>
							</div>
						</div>
						<div>
							<asp:CheckBox ID="CheckBox1" runat="server" Required="true" Text=" Eu li e aceito os Termos e Condições"/>
						</div>
						<asp:Button ID="btn_encomendar" runat="server" Text="Finalizar Encomenda" CssClass="primary-btn order-submit" OnClick="btn_encomendar_Click"/>
						<asp:Button ID="btn_limpar" runat="server" Text="Limpar Carrinho" CssClass="primary-btn order-submit" OnClick="btn_limpar_Click"/>
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
								<ul class="footer-links">
									<li><a href="#">Computadores</a></li>
									<li><a href="#">Componentes</a></li>
									<li><a href="#">Acessórios</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Informação</h3>
								<ul class="footer-links">
									<li><a href="#">Sobre Nós</a></li>
									<li><a href="#">Contacto</a></li>
									<li><a href="#">Politica de Privacidade</a></li>
									<li><a href="#">Encomendas</a></li>
									<li><a href="#">Termos e Condições</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Serviços</h3>
								<ul class="footer-links">
									<li><a href="#">A minha Conta</a></li>
									<li><a href="#">Ver Carrinho</a></li>
								</ul>
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
