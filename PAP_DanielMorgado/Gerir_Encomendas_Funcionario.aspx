<%@ Page Title="" Language="C#" MasterPageFile="~/MasterFuncionario.Master" AutoEventWireup="true" CodeBehind="Gerir_Encomendas_Funcionario.aspx.cs" Inherits="PAP_DanielMorgado.Gerir_Encomendas_Funcionario" %>
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
						<h3 class="breadcrumb-header">Encomendas</h3>
						<ul class="breadcrumb-tree">
							<li><a href="HomeFuncionario.aspx">Home</a></li>
							<li class="active">Gerir Encomendas</li>
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
                <h3 class="tm-block-title d-inline-block">Gerir Encomendas</h3>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
                  
                  <div class="form-group mb-3">
                    <label
                      for="name"
                      >Situação
                    </label>
					  <asp:DropDownList ID="ddl_situacao" runat="server" CssClass="cssdatxt" DataSourceID="SqlDataSource1" DataTextField="situacao" DataValueField="id_situacao">
                      </asp:DropDownList>
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT id_situacao, situacao FROM situacao"></asp:SqlDataSource>
                  </div>
                  
                  
                  <div class="form-group mb-3">
					  <label
                      for="name"
                      >Funcionário
                    </label>
					  <asp:DropDownList ID="ddl_funcionario" runat="server" CssClass="cssdatxt" DataSourceID="SqlDataSource4" DataTextField="nome_funcionario" DataValueField="id_funcionario" ></asp:DropDownList>
					  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT id_funcionario, nome_funcionario FROM funcionario"></asp:SqlDataSource>
                  </div>
                  <div class="form-group mb-3">
					  <label
                      for="name"
                      >Data de Entrega
                    </label>
					  <asp:TextBox ID="txt_data" runat="server" TextMode="Date" CssClass="cssdatxt"></asp:TextBox>
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
					  <asp:Button ID="btn_atualizar" runat="server" Text="Atualizar" CssClass="primary-btn order-submit" OnClick="btn_criar_Click" Visible="False" />
                  </div>

                  <div class="form-group mb-3">
                  </div>
                  <div class="form-group mb-3">    
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
					<div class="text-center">
					<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id_encomenda" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="746px" Height="114px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="id_encomenda" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id_encomenda" />
                            <asp:BoundField DataField="nome_cliente" HeaderText="Cliente" SortExpression="nome_cliente" />
                            <asp:BoundField DataField="nome_funcionario" HeaderText="Funcionário" SortExpression="nome_funcionario" />
                            <asp:BoundField DataField="data_encomenda" HeaderText="Data Encomenda" SortExpression="data_encomenda" DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="data_entrega" HeaderText="Entrega" SortExpression="data_entrega"  DataFormatString="{0:dd/MM/yyyy}" />
                            <asp:BoundField DataField="valor_total" HeaderText="Total" SortExpression="valor_total" />
                            <asp:BoundField DataField="situacao" HeaderText="Situação" SortExpression="situacao" />
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
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
					<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="133px" Visible="False" Width="577px">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="desc_modelo" HeaderText="Produto" SortExpression="desc_modelo" />
                            <asp:BoundField DataField="quantidade" HeaderText="Quantidade" SortExpression="quantidade" />
                            <asp:BoundField DataField="valor" HeaderText="Preço" SortExpression="valor" />
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
                      <br />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT modelo.desc_modelo, detalhe_encomenda.quantidade, detalhe_encomenda.valor FROM detalhe_encomenda INNER JOIN produto ON detalhe_encomenda.id_produto = produto.id_produto INNER JOIN modelo ON produto.id_modelo = modelo.id_modelo"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:lojaConnectionString %>" ProviderName="<%$ ConnectionStrings:lojaConnectionString.ProviderName %>" SelectCommand="SELECT encomendas.id_encomenda, cliente.nome_cliente, funcionario.nome_funcionario, encomendas.data_encomenda, encomendas.data_entrega, encomendas.valor_total, situacao.situacao FROM encomendas INNER JOIN situacao ON encomendas.id_situacao = situacao.id_situacao INNER JOIN cliente ON encomendas.id_cliente = cliente.id_cliente INNER JOIN funcionario ON encomendas.id_funcionario = funcionario.id_funcionario"></asp:SqlDataSource>
                
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
