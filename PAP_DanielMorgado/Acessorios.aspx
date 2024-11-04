<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCliente.Master" AutoEventWireup="true" CodeBehind="Acessorios.aspx.cs" Inherits="PAP_DanielMorgado.Acessorios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="breadcrumb" class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-12">
						<ul class="breadcrumb-tree">
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
					<!-- ASIDE -->
					<div id="aside" class="col-md-3">
						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Acessórios</h3>
							<div class="checkbox-filter">

								<div>
									<asp:CheckBox ID="chk_rato" runat="server" AutoPostBack="True" OnCheckedChanged="chk_rato_CheckedChanged" />
									<label for="category-1">
										<span></span>
										Ratos
									</label>
									<small><asp:Label ID="lbl_rato" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_tec" runat="server" AutoPostBack="True" OnCheckedChanged="chk_tec_CheckedChanged" />
									<label for="category-2">
										<span></span>
										Teclados
									</label>
									<small><asp:Label ID="lbl_tec" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_mon" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_mon_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Monitores
									</label>
									<small><asp:Label ID="lbl_mon" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_head" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_head_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Headsets
									</label>
									<small><asp:Label ID="lbl_head" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_cam" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_cam_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Cameras
									</label>
									<small><asp:Label ID="lbl_cam" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_sys" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_sys_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Sistema Operativo
									</label>
									<small><asp:Label ID="lbl_sys" runat="server" Text="Label"></asp:Label></small>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->

						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Preço</h3>
							<div class="price-filter">
								<div id="price-slider"></div>
								<div class="input-number price-min">
									<asp:TextBox ID="Txt_min" runat="server" TextMode="Number" CssClass="cssdatxt" Text="0"></asp:TextBox>
								</div>
								<span>-</span>
								<div class="input-number price-max">
									<asp:TextBox ID="Txt_max" runat="server" TextMode="Number" CssClass="cssdatxt" Text="10000"></asp:TextBox>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->


						<!-- aside Widget -->
						<div class="aside">
							<h3 class="aside-title">Marcas</h3>
							<div class="checkbox-filter">
								<div >
									<asp:CheckBox ID="chk_xi" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_xi_CheckedChanged" />
									<label for="brand-1">
										<span></span>
										Xiaomi
									</label>
									<small><asp:Label ID="lbl_xi" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_razer" runat="server" AutoPostBack="True" OnCheckedChanged="chk_razer_CheckedChanged"  />
									<label for="brand-2">
										<span></span>
										Razer
									</label>
									<small><asp:Label ID="lbl_razer" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_logi" runat="server" AutoPostBack="True" OnCheckedChanged="chk_logi_CheckedChanged"  />
									<label for="brand-3">
										<span></span>
										Logitech
									</label>
									<small><asp:Label ID="lbl_logi" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_asus" runat="server" AutoPostBack="True" OnCheckedChanged="chk_asus_CheckedChanged" />
									<label for="brand-4">
										<span></span>
										Asus
									</label>
									<small><asp:Label ID="lbl_asus" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_micro" runat="server" AutoPostBack="True" OnCheckedChanged="chk_micro_CheckedChanged"  />
									<label for="brand-5">
										<span></span>
										Microsoft
									</label>
									<small><asp:Label ID="lbl_micro" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_hyper" runat="server" AutoPostBack="True" OnCheckedChanged="chk_hyper_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										HyperX
									</label>
									<small><asp:Label ID="lbl_hyper" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_mars" runat="server" AutoPostBack="True" OnCheckedChanged="chk_mars_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										Mars Gaming
									</label>
									<small><asp:Label ID="lbl_mars" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_corsair" runat="server" AutoPostBack="True" OnCheckedChanged="chk_corsair_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										Corsair
									</label>
									<small><asp:Label ID="lbl_corsair" runat="server" Text="Label"></asp:Label></small>
								</div>
							</div>
						</div>
						<!-- /aside Widget -->

					</div>
					<!-- /ASIDE -->

					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store top filter -->
						<div class="store-filter clearfix">
							<div class="store-sort">
								<label>
									Sort By:
									<asp:DropDownList ID="DropDownList1" runat="server" CssClass="cssdatxt" Width="120" OnTextChanged="DropDownList1_TextChanged">
                                        <asp:ListItem Value=" ORDER BY produto.id_produto ASC">Posição</asp:ListItem>
                                        <asp:ListItem Value=" ORDER BY produto.preco ASC">Preço Ascendente</asp:ListItem>
                                        <asp:ListItem Value=" ORDER BY produto.preco DESC">Preço Descendente</asp:ListItem>
                                </asp:DropDownList>
								</label>
							</div>
						</div>
						<!-- /store top filter -->

						<!-- store products -->
						<asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="0"  OnItemCommand="DataList1_ItemCommand">
                            <ItemTemplate>
								<!-- product -->
										<div class="product" style="padding:10px">
											<div class="product-img">
												<asp:TextBox ID="txt_ID" runat="server" Text='<%# Eval("id_produto") %>' Visible="false"></asp:TextBox>
												<asp:ImageButton ID="Image1" runat="server" Width="350px" Height="200px" ImageUrl='<%# Eval("foto","~/img/{0}") %>' />
												<div class="product-label">
													<span class="new">Novo</span>
												</div>
											</div>
											<div class="product-body" style="left: 0px; top: 0px; width: 350px; height: 144px;">	
												<p class="product-category">Categoria</p>
												<h3 class="product-name"><a href="#"><asp:Label ID="lbl_nome" runat="server" Text='<%# Eval("desc_modelo") %>'></asp:Label></a></h3>
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
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
							ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" 
							ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" 
							SelectCommand="SELECT produto.preco, produto.foto, 
							modelo.desc_modelo, produto.id_produto FROM produto 
							INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto 
							INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN marca ON modelo.id_marca = marca.id_marca 
							WHERE (produto.id_tipo_produto = 3) OR (produto.id_tipo_produto = 9) OR (produto.id_tipo_produto = 2)"></asp:SqlDataSource>
						</div>
						<div class="row">
					</div>
					<!-- /STORE -->
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
									<li><a href="Acessórios.aspx">Acessórios</a></li>
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
