<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbissuing.aspx.cs" Inherits="WebApp.adminbissuing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
		<div class="row">
			<div class="col-md-5">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col">
								<center>
									<h4>*Issuing*</h4>
								</center>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<center>
									<img width="100px" src="imgs/books.png" />
								</center>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<hr>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Gazdi ID</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Gazdi ID"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Kiskedvenc ID</label>
									<div class="input-group">
										<asp:TextBox class="form-control" ID="TextBox1" runat="server" placeholder="Állat ID"></asp:TextBox>
										
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<label>Gazdi Neve</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Gazdi Neve" ReadOnly="True"></asp:TextBox>
									</div>
								</div>
								<div class="col-md-6">
									<label>Kiskedvenc Neve</label>
									<div class="form-group">
										<asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Állat Neve" ReadOnly="True"></asp:TextBox>
									</div>
								</div>
							</div>
							

							<div class="row">
								<div class="col-6">
									<asp:Button ID="Button2" class="btn btn-lg btn-block btn-primary" runat="server" Text="Gazdi Keres" OnClick="Button2_Click" />
								</div>
								<div class="col-6">
									<asp:Button ID="Button4" class="btn btn-lg btn-block btn-success" runat="server" Text="Kiskedvenc Keres" OnClick="Button4_Click" />
								</div>
							</div>
						</div>
					</div>
					<a href="homepage.aspx"><< Back to Home
					</a>
					<br>
						<br>
						</div>
						<div class="col-md-7">
							<div class="card">
								<div class="card-body">
									<div class="row">
										<div class="col">
											<center>
												<h4>* List *</h4>
											</center>
										</div>
									</div>
									<div class="row">
										<div class="col">
											<hr>
											</div>
										</div>
										<div class="row">
											<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT  Gazdik.GazdiID, Allatok.AllatID,Allatok.Neve,Allatok.SzuletesiIdo,Allatok.Faj,Allatok.Fajta
FROM Gazdik
INNER JOIN Allatok ON Gazdik.GazdiID = Allatok.AllatID">
											</asp:SqlDataSource>
											<div class="col">
												<asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="GazdiID,AllatID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
													<Columns>
														<asp:BoundField DataField="GazdiID" HeaderText="GazdiID" SortExpression="GazdiID" ReadOnly="True"></asp:BoundField>
														<asp:BoundField DataField="AllatID" HeaderText="ÁllatID" SortExpression="AllatID" ReadOnly="True"></asp:BoundField>
														<asp:BoundField DataField="Neve" HeaderText="Neve" SortExpression="Neve"></asp:BoundField>
														<asp:BoundField DataField="SzuletesiIdo" HeaderText="Születési Idő" SortExpression="SzuletesiIdo"></asp:BoundField>
														<asp:BoundField DataField="Faj" HeaderText="Faj" SortExpression="Faj"></asp:BoundField>
														<asp:BoundField DataField="Fajta" HeaderText="Fajta" SortExpression="Fajta"></asp:BoundField>
													</Columns>
												</asp:GridView>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

</asp:Content>
