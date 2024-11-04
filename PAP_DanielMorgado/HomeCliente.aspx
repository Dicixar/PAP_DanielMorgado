	<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCliente.Master" AutoEventWireup="true" CodeBehind="HomeCliente.aspx.cs" Inherits="PAP_DanielMorgado.HomeCliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <body>
		<!-- /NAVIGATION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="img/computador.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Computadores</h3>
								<a href="Computadores.aspx" class="cta-btn">Compre Agora<i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="img/componentes.png" alt="" height="204">
							</div>
							<div class="shop-body">
								<h3>Componentes</h3>
								<a href="Componentes.aspx" class="cta-btn">Compre Agora <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->

					<!-- shop -->
					<div class="col-md-4 col-xs-6">
						<div class="shop">
							<div class="shop-img">
								<img src="img/acessorios.png" alt="">
							</div>
							<div class="shop-body">
								<h3>Acessórios</h3>
								<a href="Acessorios.aspx" class="cta-btn">Compre Agora <i class="fa fa-arrow-circle-right"></i></a>
							</div>
						</div>
					</div>
					<!-- /shop -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Novos Produtos</h3>
							<div class="section-nav">
							</div>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div>
										<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
											<ItemTemplate>
												<!-- product -->
													<div class="product" style="padding:10px">
											<div class="product-img">
												<asp:TextBox ID="txt_ID" runat="server" Visible="false" Text='<%# Eval("id_produto") %>'></asp:TextBox>
												<asp:ImageButton ID="Image1" runat="server" Width="350px" Height="200px" ImageUrl='<%# Eval("foto","~/img/{0}") %>'/>
												<div class="product-label">
													<span class="new">Novo</span>
												</div>
											</div>
											<div class="product-body" style="left: 0px; top: 0px; width: 350px; height: 144px;">	
												<p class="product-category">Category</p>
												<h3 class="product-name"><a href="#"><asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("desc_modelo") %>'></asp:HyperLink></a></h3>
												<h4 class="product-price"><asp:Label ID="lbl_preco" runat="server" Text='<%# Eval("preco") %>'></asp:Label></h4>
												<div class="product-rating">
												</div>
												<div class="product-btns">
												</div>
											</div>
											<div class="add-to-cart" style="left: 13px; right: 13px; bottom: 1px">
												<asp:Button ID="btn_adicionar" runat="server" Text="Adicionar" CssClass="add-to-cart-btn"/></i></button>
											</div>
										</div>
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
								<br />
									</ItemTemplate>
										</asp:DataList>
								    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT produto.id_produto, modelo.desc_modelo, produto.preco, produto.foto FROM modelo INNER JOIN produto ON modelo.id_modelo = produto.id_modelo ORDER BY id_produto DESC LIMIT 3"></asp:SqlDataSource>	
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title">Destaques</h3>
							<div class="section-nav">
								<ul class="section-tab-nav tab-nav">
								</ul>
							</div>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab2" class="tab-pane fade in active">
									
										<asp:DataList ID="DataList5" runat="server" DataSourceID="SqlDataSource3" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList5_ItemCommand">
											<ItemTemplate>
												<!-- product -->
													<div class="product" style="padding:10px">
											<div class="product-img">
												<asp:TextBox ID="txt_ID" runat="server" Visible="false" Text='<%# Eval("id_produto") %>'></asp:TextBox>
												<asp:ImageButton ID="Image1" runat="server" Width="350px" Height="200px" ImageUrl='<%# Eval("foto","~/img/{0}") %>'/>
												<div class="product-label">
													<span class="new">Novo</span>
												</div>
											</div>
											<div class="product-body" style="left: 0px; top: 0px; width: 350px; height: 144px;">	
												<p class="product-category">Category</p>
												<h3 class="product-name"><a href="#"><asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("desc_modelo") %>'></asp:HyperLink></a></h3>
												<h4 class="product-price"><asp:Label ID="lbl_preco" runat="server" Text='<%# Eval("preco") %>'></asp:Label></h4>
												<div class="product-rating">
												</div>
												<div class="product-btns">
												</div>
											</div>
											<div class="add-to-cart" style="left: 13px; right: 13px; bottom: 1px">
												<asp:Button ID="btn_adicionar" runat="server" Text="Adicionar" CssClass="add-to-cart-btn"/></i></button>
											</div>
										</div>
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
								<br />
											</ItemTemplate>
										</asp:DataList>
									</div>
									<div id="slick-nav-2" class="products-slick-nav"></div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- /Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">Novos Produtos</h4>
							<div class="section-nav">
								<div id="slick-nav-3" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-3">
							<div>
								<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand">
									<ItemTemplate>
										<!-- product widget -->
											<div class="product-widget">
												<div class="product-img">
													<asp:TextBox ID="txt_ID" runat="server" Visible="false" Text='<%# Eval("id_produto") %>'></asp:TextBox>
													<asp:ImageButton ID="Image2" runat="server" ImageUrl='<%# Eval("foto","~/img/{0}") %>' Height="36" Width="56"/>
												</div>
												<div class="product-body">
													<p class="product-category">Category</p>
													<h3 class="product-name"><a href="#"><asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("desc_modelo") %>'></asp:HyperLink></a></h3>
													<h4 class="product-price"><asp:Label ID="lbl_preco" runat="server" Text='<%# Eval("preco") %>'></asp:Label></h4>
												</div>
											</div>
										<!-- /product widget -->
									</ItemTemplate>
								</asp:DataList>
								<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT produto.id_produto, modelo.desc_modelo, produto.preco, produto.foto FROM modelo INNER JOIN produto ON modelo.id_modelo = produto.id_modelo ORDER BY id_produto DESC LIMIT 3"></asp:SqlDataSource>
							</div>
						</div>
					</div>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">Ultimas Unidades</h4>
							<div class="section-nav">
								<div id="slick-nav-4" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-4">
							<div>
								<asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4" OnItemCommand="DataList3_ItemCommand">
									<ItemTemplate>
										<!-- product widget -->
											<div class="product-widget">
												<div class="product-img">
													<asp:TextBox ID="txt_ID" runat="server" Visible="false" Text='<%# Eval("id_produto") %>'></asp:TextBox>
													<asp:ImageButton ID="Image2" runat="server" ImageUrl='<%# Eval("foto","~/img/{0}") %>' Height="36" Width="56"/>
												</div>
												<div class="product-body">
													<p class="product-category">Category</p>
													<h3 class="product-name"><asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("desc_modelo") %>'></asp:HyperLink></a></h3>
													<h4 class="product-price"><asp:Label ID="lbl_preco" runat="server" Text='<%# Eval("preco") %>'></asp:Label></h4>
												</div>
											</div>
										<!-- /product widget -->
									</ItemTemplate>
								</asp:DataList>
								<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT produto.quantidade, produto.id_produto, modelo.desc_modelo, produto.preco, produto.foto FROM modelo INNER JOIN produto ON modelo.id_modelo = produto.id_modelo ORDER BY quantidade ASC LIMIT 3"></asp:SqlDataSource>
							</div>
						</div>
					</div>

					<div class="clearfix visible-sm visible-xs"></div>

					<div class="col-md-4 col-xs-6">
						<div class="section-title">
							<h4 class="title">Destaques</h4>
							<div class="section-nav">
								<div id="slick-nav-5" class="products-slick-nav"></div>
							</div>
						</div>

						<div class="products-widget-slick" data-nav="#slick-nav-5">
							<div>
								<asp:DataList ID="DataList4" runat="server" DataSourceID="SqlDataSource3" OnItemCommand="DataList4_ItemCommand">
									<ItemTemplate>
										<!-- product widget -->
											<div class="product-widget">
												<div class="product-img">
													<asp:TextBox ID="txt_ID" runat="server" Visible="false" Text='<%# Eval("id_produto") %>'></asp:TextBox>
													<asp:ImageButton ID="Image2" runat="server" ImageUrl='<%# Eval("foto","~/img/{0}") %>' Height="36" Width="56"/>
												</div>
												<div class="product-body">
													<p class="product-category">Category</p>
													<h3 class="product-name"><a href="#"><asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval("desc_modelo") %>'></asp:HyperLink></a></h3>
													<h4 class="product-price"><asp:Label ID="lbl_preco" runat="server" Text='<%# Eval("preco") %>'></asp:Label></h4>
												</div>
											</div>
										<!-- /product widget -->
									</ItemTemplate>
								</asp:DataList>
								<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT produto.quantidade, produto.id_produto, modelo.desc_modelo, produto.preco, produto.foto FROM modelo INNER JOIN produto ON modelo.id_modelo = produto.id_modelo WHERE preco BETWEEN 500 AND 2000 LIMIT 3"></asp:SqlDataSource>
							
							</div>
						</div>
					</div>
				  </div>
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
									<li><a href="Computadores.aspx">Computadores</a></li>
									<li><a href="Componentes.aspx">Componentes</a></li>
									<li><a href="Acessorios.aspx">Acessórios</a></li>
								</ul>
							</div>
						</div>

						<div class="clearfix visible-xs"></div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Informação</h3>
								<ul class="footer-links">
									<li><a href="#">Sobre Nós</a></li>
									<li><a href="#">Politica de Privacidade</a></li>
									<li><a href="PerfilCliente.aspx">Encomendas</a></li>
									<li><a href="#">Termos e Condições</a></li>
								</ul>
							</div>
						</div>

						<div class="col-md-3 col-xs-6">
							<div class="footer">
								<h3 class="footer-title">Serviços</h3>
								<ul class="footer-links">
									<li><a href="PerfilCliente.aspx">A minha Conta</a></li>
									<li><a href="Carrinho.aspx">Ver Carrinho</a></li>
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
