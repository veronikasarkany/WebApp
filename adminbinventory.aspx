<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminbinventory.aspx.cs" Inherits="WebApp.adminbinventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

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
                           <h4>Kisállat adatok</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/lady-dog.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:FileUpload class="form-control" ID="FileUpload1" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>Állat ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Mikrochip száma"></asp:TextBox> <br />
                              <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Állat Neve</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Állat Neve"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  
                   <div class="row">
                     <div class="col-md-4">
                        <label>Születési idő</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Születési idő" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Faj</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Faj" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Fajta</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Fajta" ></asp:TextBox>
                        </div>
                     </div>
                  </div>

                    <div class="row">
                       <div class="col-md-2">
                        <label>Ivar</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Nöstény/Kan" ></asp:TextBox>
                        </div>
                     </div>

                     <div class="col-md-4">
                        <label>Ivartalanítás időpontja</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Ivartalanítás időpontja" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                    
                     <div class="col-md-3">
                        <label>Színe</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Színe" ></asp:TextBox>
                        </div>
                     </div>

                        <div class="col-md-3">
                        <label>Törzskönyvezett</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox13" runat="server" placeholder="Igen / Nem" ></asp:TextBox>
                        </div>
                     </div>

                  </div>

                  
                  <div class="row">
                     <div class="col-12">
                        <label>Különleges Ismertető jele</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Különleges Ismertető jele" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Hozzáad" OnClick="Button1_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Frissítés" OnClick="Button3_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Törlés" OnClick="Button2_Click"  />
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< vissza a Főoldalra</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Lista</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Allatok]"></asp:SqlDataSource>
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AllatID" DataSourceID="SqlDataSource1">
                           <Columns>
                              <asp:BoundField DataField="AllatID" HeaderText="AllatID" ReadOnly="True" SortExpression="AllatID" >
                              </asp:BoundField>
                               <asp:BoundField DataField="Neve" HeaderText="Neve" SortExpression="Neve" />
                               <asp:BoundField DataField="SzuletesiIdo" DataFormatString="{0:yyyy.MM.dd}" HeaderText="Születési Idő" SortExpression="SzuletesiIdo" />
                               <asp:BoundField DataField="Faj" HeaderText="Faj" SortExpression="Faj" />
                               <asp:BoundField DataField="Fajta" HeaderText="Fajta" SortExpression="Fajta" />
                               <asp:BoundField DataField="Ivar" HeaderText="Ivar" SortExpression="Ivar" />
                               <asp:BoundField DataField="Szine" HeaderText="Színe" SortExpression="Szine" />
                               <asp:BoundField DataField="KulonlegesIsmertetoJele" HeaderText="Ismertető Jele" SortExpression="KulonlegesIsmertetoJele" />
                           </Columns>
                        </asp:GridView>
                     </div>
               </div>
            </div>
         </div>
      </div>
   </div>

</asp:Content>
