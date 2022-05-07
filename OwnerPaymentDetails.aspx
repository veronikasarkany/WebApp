<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OwnerPaymentDetails.aspx.cs" Inherits="WebApp.OwnerPaymentDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
      <div class="row">
          <!-- Bal oldal - User Profil -->
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="imgs/lazyprogrammer.jpg"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Profil adatai</h4>
                           <span>Fiók Állapot - </span>
                           <asp:Label class="badge badge-pill badge-info" ID="Label1" runat="server" Text="Az Ön állapota"></asp:Label>
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
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Teljes Név" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Gazdi ID</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Gazdi ID" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Telefonszám</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Telefonszám" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Email cím</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Email cím" TextMode="Email" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                  <div class="col-md-6">
                        <label>Irányítószám</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox7" runat="server" placeholder="Irányítószám" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                      <div class="col-md-6">
                        <label>Város</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox6" runat="server" placeholder="Város" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <label>Cím</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Cím" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  

               </div>
            </div>
            <a href="homepage.aspx"><< vissza a Főoldalra</a><br><br>
         </div>
          <!-- User Profil vége -->
          
          <!-- Jobb oldal -->

         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="150px" src="imgs/f007.gif"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Rendelkezésre Álló Összeg</h4>
                            
                           <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Befizetések"></asp:Label>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
  
                  
                   <div class="row">
                     <div class="col-md-4">
                        <label>Dátum</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Dátum" TextMode="Date" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Befizetések Összesen</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" placeholder="Befizetések Összesen" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Kezelési Költség</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox15" runat="server" placeholder="Kezelési Költség" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>
                  </div>

                    <div class="row">
                       <div class="col-md-4">
                        <label>Rendelkezésre Álló Összeg</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox16" runat="server" placeholder="Felhasználható Összeg" ReadOnly="True" ></asp:TextBox> 
                        </div>
                     </div>
                    </div>
                                    
               </div>
            </div>
         </div>

</asp:Content>
