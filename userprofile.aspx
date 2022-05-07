<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userprofile.aspx.cs" Inherits="WebApp.userprofile" %>
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
                           <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Teljes Név"></asp:TextBox>
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
                           <span class="badge badge-pill badge-info">Bejelentkezési adatait</span>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Gazdi ID</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox8" runat="server" placeholder="Gazdi ID" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Régi jelszó</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox9" runat="server" placeholder="Régi jelszó" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Új jelszó</label>
                        <div class="form-group">
                           <asp:TextBox class="form-control" ID="TextBox10" runat="server" placeholder="Új jelszó" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-8 mx-auto">
                        <center>
                           <div class="form-group">
                              <asp:Button class="btn btn-primary btn-block btn-lg" ID="Button1" runat="server" Text="Fissítés" OnClick="Button1_Click" />
                           </div>
                        </center>
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
                           <img width="100px" src="imgs/dog-cocktail-alkohol-icon.png"/>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Állat(ok) adatai</h4>
                            
                           <asp:Label class="badge badge-pill badge-info" ID="Label2" runat="server" Text="Kisállat adatok"></asp:Label>
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
                        <label>Állat ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Mikrochip száma" ReadOnly="True"></asp:TextBox>
                              
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Állat Neve</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Állat Neve" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  
                   <div class="row">
                     <div class="col-md-4">
                        <label>Születési idő</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Születési idő" TextMode="Date" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Faj</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox14" runat="server" placeholder="Faj" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Fajta</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox15" runat="server" placeholder="Fajta" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>
                  </div>

                    <div class="row">
                       <div class="col-md-2">
                        <label>Ivar</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox16" runat="server" placeholder="Nöstény/Kan" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>

                     <div class="col-md-4">
                        <label>Ivartalanítás időpontja</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox17" runat="server" placeholder="Ivartalanítás időpontja" TextMode="Date" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                    
                     <div class="col-md-3">
                        <label>Színe</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox18" runat="server" placeholder="Színe" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>

                        <div class="col-md-3">
                        <label>Törzskönyvezett</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox19" runat="server" placeholder="Igen / Nem" ReadOnly="True" ></asp:TextBox>
                        </div>
                     </div>

                  </div>

                  
                  <div class="row">
                     <div class="col-12">
                        <label>Különleges Ismertető jele</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox20" runat="server" placeholder="Különleges Ismertető jele" TextMode="MultiLine" Rows="2" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                 
              
            

               </div>
            </div>
         </div>
   

</asp:Content>
