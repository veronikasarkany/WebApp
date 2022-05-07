<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usersignup.aspx.cs" Inherits="WebApp.usersignup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                                <div class="col">
                                    <center>
                                        <img width="100px" src="imgs/cat-pirate-icon.png"/>
                                    </center>
                                </div>
                        </div>

                        <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Regisztráció</h4>
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
                                   <label>Teljes Név</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Név"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Gazdi ID</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Gazdi ID" ></asp:TextBox>

                                    </div>
                                </div>
                        </div>


                        <div class="row">
                                <div class="col-md-6">
                                   <label>Telefonszám</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Telefonszám" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Email cím</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email cím" TextMode="Email"></asp:TextBox>

                                    </div>
                                </div>
                        </div>

                        <div class="row">
                                <div class="col-md-6">
                                    <label>Irányítószám</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Irányítószám" TextMode="Number"></asp:TextBox>

                                    </div>
                                </div>
                                   

                                <div class="col-md-6">
                                    <label>Város</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Város"></asp:TextBox>

                                    </div>
                                </div>

                            
                        </div>

                         <div class="row">
                                <div class="col">
                                   <label>Cím</label>
                                    <div class="form-group">
                                        <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Cím" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    </div>
                                </div>
                                
                        </div>

                        <div class="row">                       
                                <div class="col">
                                    <center>
                                    <span class="badge badge-pill badge-info">Bejelentkezési adatait</span></center>
                                </div>                                
                        </div>

                        <div class="row">
                                <div class="col-md-6">
                                   <label>Állat ID</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Állat ID"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label>Jelszó</label>
                                    <div class="form-group">
                                        <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Jelszó" TextMode="Password"></asp:TextBox>

                                    </div>
                                </div>
                        </div>



                        <div class="row">
                                <div class="col">
                                    <div class="form-group">
                                        <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Regisztrál" OnClick="Button1_Click"  />

                                    </div>
                                </div>
                        </div>


                    </div>
                </div>

                <a href="homepage.aspx"><< vissza a Főoldara</a><br><br>
            </div>
            
        </div>
    </div>


</asp:Content>
