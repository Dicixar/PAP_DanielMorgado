<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCliente.Master" AutoEventWireup="true" CodeBehind="Componentes.aspx.cs" Inherits="PAP_DanielMorgado.Componentes" %>
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
							<h3 class="aside-title">Componentes</h3>
							<div class="checkbox-filter">

								<div>
									<asp:CheckBox ID="chk_placa" runat="server" AutoPostBack="True" OnCheckedChanged="chk_placa_CheckedChanged" />
									<label for="category-1">
										<span></span>
										Placas Graficas
									</label>
									<small><asp:Label ID="lbl_placa" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_board" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_board_CheckedChanged" />
									<label for="category-2">
										<span></span>
										Motherboards
									</label>
									<small><asp:Label ID="lbl_board" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_proce" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_proce_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Processadores
									</label>
									<small><asp:Label ID="lbl_proce" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_ram" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_ram_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Memoria RAM
									</label>
									<small><asp:Label ID="lbl_ram" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_ssd" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_ssd_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Armazenamento SSD
									</label>
									<small><asp:Label ID="lbl_ssd" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_hdd" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_hdd_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Armazenamento HDD
									</label>
									<small><asp:Label ID="lbl_hdd" runat="server" Text="Label"></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_fonte" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_fonte_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Fonte Alimentacao
									</label>
									<small><asp:Label ID="lbl_fonte" runat="server" Text=""></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_caixa" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_caixa_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Caixas
									</label>
									<small><asp:Label ID="lbl_caixa" runat="server" Text=""></asp:Label></small>
								</div>

								<div>
									<asp:CheckBox ID="chk_vent" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_vent_CheckedChanged" />
									<label for="category-3">
										<span></span>
										Ventoinhas
									</label>
									<small><asp:Label ID="lbl_vent" runat="server" Text=""></asp:Label></small>
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
									<asp:CheckBox ID="chk_amd" runat="server"  AutoPostBack="True" OnCheckedChanged="chk_amd_CheckedChanged" />
									<label for="brand-1">
										<span></span>
										AMD
									</label>
									<small><asp:Label ID="lbl_amd" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_intel" runat="server" AutoPostBack="True" OnCheckedChanged="chk_intel_CheckedChanged" />
									<label for="brand-2">
										<span></span>
										Intel
									</label>
									<small><asp:Label ID="lbl_intel" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_giga" runat="server" AutoPostBack="True" OnCheckedChanged="chk_giga_CheckedChanged" />
									<label for="brand-3">
										<span></span>
										Gigabyte
									</label>
									<small><asp:Label ID="lbl_giga" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_nvidia" runat="server" AutoPostBack="True" OnCheckedChanged="chk_nvidia_CheckedChanged" />
									<label for="brand-4">
										<span></span>
										Nvidia
									</label>
									<small><asp:Label ID="lbl_nvidia" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_king" runat="server" AutoPostBack="True" OnCheckedChanged="chk_king_CheckedChanged"  />
									<label for="brand-5">
										<span></span>
										Kingston
									</label>
									<small><asp:Label ID="lbl_king" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_skill" runat="server" AutoPostBack="True" OnCheckedChanged="chk_skill_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										G.Skill
									</label>
									<small><asp:Label ID="lbl_skill" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_asus" runat="server" AutoPostBack="True" OnCheckedChanged="chk_asus_CheckedChanged"/>
									<label for="brand-6">
										<span></span>
										Asus
									</label>
									<small><asp:Label ID="lbl_asus" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_corsair" runat="server" AutoPostBack="True" OnCheckedChanged="chk_corsair_CheckedChanged"/>
									<label for="brand-6">
										<span></span>
										Corsair
									</label>
									<small><asp:Label ID="lbl_corsair" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_msi" runat="server" AutoPostBack="True" OnCheckedChanged="chk_msi_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										MSI
									</label>
									<small><asp:Label ID="lbl_msi" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_nzxt" runat="server" AutoPostBack="True" OnCheckedChanged="chk_nzxt_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										NZXT
									</label>
									<small><asp:Label ID="lbl_nzxt" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_cooler" runat="server" AutoPostBack="True" OnCheckedChanged="chk_cooler_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										Cooler Master
									</label>
									<small><asp:Label ID="lbl_cooler" runat="server" Text="Label"></asp:Label></small>
								</div>
								<div>
									<asp:CheckBox ID="chk_evga" runat="server" AutoPostBack="True" OnCheckedChanged="chk_evga_CheckedChanged" />
									<label for="brand-6">
										<span></span>
										EVGA
									</label>
									<small><asp:Label ID="lbl_evga" runat="server" Text="Label"></asp:Label></small>
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
									<asp:DropDownList ID="DropDownList1" runat="server" CssClass="cssdatxt" Width="120">
                                        <asp:ListItem Value=" ORDER BY produto.id_produto ASC">Posição</asp:ListItem>
                                        <asp:ListItem Value=" ORDER BY produto.preco ASC">Preço Ascendente</asp:ListItem>
                                        <asp:ListItem Value=" ORDER BY produto.preco DESC">Preço Descendente</asp:ListItem>
                                </asp:DropDownList>
								</label>
							</div>
						</div>
						<!-- /store top filter -->

						<!-- store products -->
						<asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" CellPadding="0" OnLoad="DataList1_Load" OnItemCommand="DataList1_ItemCommand">
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
						<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT produto.preco, produto.foto, modelo.desc_modelo, produto.id_produto FROM produto INNER JOIN tipo_produto ON produto.id_tipo_produto = tipo_produto.id_tipo_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo INNER JOIN marca ON modelo.id_marca = marca.id_marca WHERE (produto.id_tipo_produto = 1) OR (produto.id_tipo_produto = 4) OR (produto.id_tipo_produto = 5) OR(produto.id_tipo_produto = 7) OR (produto.id_tipo_produto = 8) OR (produto.id_tipo_produto = 10) OR(produto.id_tipo_produto = 11) OR (produto.id_tipo_produto = 12)"></asp:SqlDataSource>
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
