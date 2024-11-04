<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.Master" AutoEventWireup="true" CodeBehind="Gerir_Produtos.aspx.cs" Inherits="PAP_DanielMorgado.Gerir_Produtos" %>
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
						<h3 class="breadcrumb-header">Produtos</h3>
						<ul class="breadcrumb-tree">
							<li><a href="HomeAdmin.aspx">Home</a></li>
							<li class="active">Adicionar Produtos</li>
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
                <h3 class="tm-block-title d-inline-block">Adicionar Produto</h3>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                  
                  <div class="form-group mb-3">
                    <label
                      for="name"
                      >Marca do Produto
                    </label>
                      <asp:DropDownList ID="ddl_marca" runat="server" CssClass="cssdatxt" required="true" DataSourceID="SqlDataSource2" DataTextField="marca" DataValueField="id_marca"></asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT id_marca, marca FROM marca ORDER BY marca ASC"></asp:SqlDataSource>
                  </div>
                  
                  
                  <div class="form-group mb-3">
                    <label
                      for="name"
                      >Modelo
                    </label>
                        <asp:TextBox ID="txt_modelo" runat="server" CssClass="cssdatxt" required="true" MaxLength="100"></asp:TextBox>
                        <asp:TextBox ID="txt_idmodelo" runat="server" CssClass="cssdatxt" required="true" MaxLength="100" Visible="False"></asp:TextBox>
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="description"
                      >Descrição</label
                    >
                    <asp:TextBox ID="txt_desc" runat="server" CssClass="cssdatxt" MaxLength="1000"  Height="100" required="true" TextMode="MultiLine"></asp:TextBox>
                  </div>
                  
                  <div class="row">
                  <div class="form-group mb-3 col-xs-12 col-sm-6">
                  <label for="category">Categoria</label>
                  <asp:DropDownList ID="ddl_categoria" runat="server" CssClass="cssdatxt" required="true" Width="150" DataSourceID="SqlDataSource1" DataTextField="descricao_produto" DataValueField="id_tipo_produto"></asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT id_tipo_produto, descricao_produto FROM tipo_produto"></asp:SqlDataSource>
                  </div>
                    </div>
                      <div class="row">
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label
                            for="stock"
                            >Unidades
                          </label>
                          <asp:TextBox ID="txt_unidades" runat="server" CssClass="cssdatxt" required="true" TextMode="Number"></asp:TextBox>
                        </div>
                  </div>

                  <div class="form-group mb-3">
                    <asp:Label ID="lbl_foto" runat="server" Text="Foto do Produto" CssClass="" Font-Bold="True"></asp:Label>
                    <asp:FileUpload ID="flp_foto" runat="server"/>
                  </div>

                  <div class="form-group mb-3">
                    <label for="description">Preço</label>
                    <asp:TextBox ID="txt_preco" runat="server" CssClass="cssdatxt" Width="150" required="true" TextMode="SingleLine"></asp:TextBox>
                      <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="O preço não pode conter Pontos e tem de ser entre 0,1 e 1000000" ControlToValidate="txt_preco" Type="Double" MaximumValue="1000000" MinimumValue="0,1"></asp:RangeValidator></div>
                  <div class="form-group mb-3">
                    <label
                      for="description"
                      >Garantia</label
                    >
                      <asp:DropDownList ID="ddl_garantia" runat="server" CssClass="cssdatxt" Width="100" required="true">
                          <asp:ListItem>2 Anos</asp:ListItem>
                          <asp:ListItem>3 Anos</asp:ListItem>
                          <asp:ListItem>4 Anos</asp:ListItem>
                          <asp:ListItem>5 Anos</asp:ListItem>
                      </asp:DropDownList>
                  </div>

                  <div class="form-group mb-3">
                    <asp:Button ID="btn_criar" runat="server" Text="Criar" CssClass="primary-btn order-submit" OnClick="btn_criar_Click" />
                    <asp:Button ID="btn_editar" runat="server" Text="Editar" CssClass="primary-btn order-submit" Visible="False" OnClick="btn_editar_Click" />
                    <asp:Button ID="btn_eliminar" runat="server" Text="Eliminar" CssClass="primary-btn order-submit" Visible="False" OnClick="btn_eliminar_Click" />
                  </div>

                  
              </div>
              <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="FileUpload1;"
                  ></i>
                </div>
                <div class="custom-file mt-3 mb-3">
					<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AutoGenerateSelectButton="True" CellPadding="4" DataKeyNames="id_produto" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" Width="732px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id_produto" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_produto">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="descricao_produto" HeaderText="Categoria" SortExpression="descricao_produto">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="desc_modelo" HeaderText="Modelo" SortExpression="desc_modelo">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="preco" HeaderText="Preço" SortExpression="preco">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="foto" DataImageUrlFormatString="~/img/{0}" HeaderText="Foto">
                                <ControlStyle Height="100px" Width="150px" />
                            </asp:ImageField>
                            <asp:BoundField DataField="garantia" HeaderText="Garantia" SortExpression="garantia">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="quantidade" HeaderText="Quantidade" SortExpression="quantidade">
                            <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT produto.id_produto, tipo_produto.descricao_produto, modelo.desc_modelo, produto.preco, produto.foto, produto.garantia, produto.quantidade FROM tipo_produto INNER JOIN produto ON tipo_produto.id_tipo_produto = produto.id_tipo_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo order by tipo_produto.id_tipo_produto"></asp:SqlDataSource>
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
