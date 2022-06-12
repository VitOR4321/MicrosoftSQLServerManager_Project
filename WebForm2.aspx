<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WiktorGórski_Projekt.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <h3>
        Dane egzaminowanych:
    </h3>
    <h4> Wybierz konkretnego kursanta</h4>
     <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="egzaminowani" DataValueField="pesel">
     </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDvkursant %>" SelectCommand="SELECT pesel, imie + ' ' + nazwisko AS egzaminowani FROM kursanci ORDER BY pesel"></asp:SqlDataSource>
    <br />
    <h4> Dane konkretnego kursanta</h4>
     <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="PKK" DataSourceID="SqlDataSource2" Height="50px" Width="125px">
         <Fields>
             <asp:BoundField DataField="PKK" HeaderText="PKK" ReadOnly="True" SortExpression="PKK" />
             <asp:BoundField DataField="pesel" HeaderText="pesel" SortExpression="pesel" />
             <asp:BoundField DataField="egzaminowany" HeaderText="egzaminowany" ReadOnly="True" SortExpression="egzaminowany" />
             <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
             <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
             <asp:BoundField DataField="OKS" HeaderText="OKS" SortExpression="OKS" />
         </Fields>
     </asp:DetailsView>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORD_Kursanci %>" SelectCommand="SELECT PKK, pesel, imie + ' ' + nazwisko AS egzaminowany, miasto, adres, OKS FROM kursanci WHERE (pesel = @param1) ORDER BY pesel">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList1" Name="param1" PropertyName="SelectedValue" Type="String" />
         </SelectParameters>
     </asp:SqlDataSource>
    <br />
    <h4> Wyszystkie dane</h4>
    <br />
     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="PKK" DataSourceID="SqlDataSource3">
         <Columns>
             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
             <asp:BoundField DataField="PKK" HeaderText="PKK" ReadOnly="True" SortExpression="PKK" />
             <asp:BoundField DataField="pesel" HeaderText="pesel" SortExpression="pesel" />
             <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
             <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
             <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
             <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
             <asp:BoundField DataField="OKS" HeaderText="OKS" SortExpression="OKS" />
         </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDv1 %>" SelectCommand="SELECT * FROM [kursanci]" DeleteCommand="DELETE FROM [kursanci] WHERE [PKK] = @PKK" InsertCommand="INSERT INTO [kursanci] ([PKK], [pesel], [imie], [nazwisko], [miasto], [adres], [OKS]) VALUES (@PKK, @pesel, @imie, @nazwisko, @miasto, @adres, @OKS)" UpdateCommand="UPDATE [kursanci] SET [pesel] = @pesel, [imie] = @imie, [nazwisko] = @nazwisko, [miasto] = @miasto, [adres] = @adres, [OKS] = @OKS WHERE [PKK] = @PKK">
         <DeleteParameters>
             <asp:Parameter Name="PKK" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="PKK" Type="String" />
             <asp:Parameter Name="pesel" Type="String" />
             <asp:Parameter Name="imie" Type="String" />
             <asp:Parameter Name="nazwisko" Type="String" />
             <asp:Parameter Name="miasto" Type="String" />
             <asp:Parameter Name="adres" Type="String" />
             <asp:Parameter Name="OKS" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="pesel" Type="String" />
             <asp:Parameter Name="imie" Type="String" />
             <asp:Parameter Name="nazwisko" Type="String" />
             <asp:Parameter Name="miasto" Type="String" />
             <asp:Parameter Name="adres" Type="String" />
             <asp:Parameter Name="OKS" Type="String" />
             <asp:Parameter Name="PKK" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>
    <h3>
        Dane egzaminów:
    </h3>
    <h4> Wybierz konkretne PKK aby wyświtlić egzaminy</h4>
     <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource4" DataTextField="idegzaminu" DataValueField="idegzaminu" AutoPostBack="True">
     </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDvEgzamin %>" SelectCommand="SELECT [idegzaminu] FROM [egzaminy]"></asp:SqlDataSource>
    <br />
    <h4> Dane konkretnego PKK</h4>
     <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="idegzaminu" DataSourceID="SqlDataSource5" Height="50px" Width="125px">
         <Fields>
             <asp:BoundField DataField="idegzaminu" HeaderText="idegzaminu" InsertVisible="False" ReadOnly="True" SortExpression="idegzaminu" />
             <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
             <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
             <asp:BoundField DataField="godzina" HeaderText="godzina" SortExpression="godzina" />
             <asp:BoundField DataField="PKK" HeaderText="PKK" SortExpression="PKK" />
         </Fields>
     </asp:DetailsView>
     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORD_Egzaminy %>" SelectCommand="SELECT idegzaminu, rodzaj, data, godzina, PKK FROM egzaminy WHERE (idegzaminu = @para2)">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList2" Name="para2" PropertyName="SelectedValue" />
         </SelectParameters>
     </asp:SqlDataSource>
    <br />
    <h4> Wyszystkie dane</h4>
    <br />
     <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="idegzaminu" DataSourceID="SqlDataSource7">
         <Columns>
             <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
             <asp:BoundField DataField="idegzaminu" HeaderText="idegzaminu" InsertVisible="False" ReadOnly="True" SortExpression="idegzaminu" />
             <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
             <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
             <asp:BoundField DataField="godzina" HeaderText="godzina" SortExpression="godzina" />
             <asp:BoundField DataField="PKK" HeaderText="PKK" SortExpression="PKK" />
         </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDv2 %>" SelectCommand="SELECT * FROM [egzaminy]" DeleteCommand="DELETE FROM [egzaminy] WHERE [idegzaminu] = @idegzaminu" InsertCommand="INSERT INTO [egzaminy] ([rodzaj], [data], [godzina], [PKK]) VALUES (@rodzaj, @data, @godzina, @PKK)" UpdateCommand="UPDATE [egzaminy] SET [rodzaj] = @rodzaj, [data] = @data, [godzina] = @godzina, [PKK] = @PKK WHERE [idegzaminu] = @idegzaminu">
         <DeleteParameters>
             <asp:Parameter Name="idegzaminu" Type="Decimal" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="rodzaj" Type="String" />
             <asp:Parameter DbType="Date" Name="data" />
             <asp:Parameter DbType="Time" Name="godzina" />
             <asp:Parameter Name="PKK" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="rodzaj" Type="String" />
             <asp:Parameter DbType="Date" Name="data" />
             <asp:Parameter DbType="Time" Name="godzina" />
             <asp:Parameter Name="PKK" Type="String" />
             <asp:Parameter Name="idegzaminu" Type="Decimal" />
         </UpdateParameters>
     </asp:SqlDataSource>
    <br />
    <h3>Historia egzaminów:
    </h3>
    <h4> Wybierz konkretny zapis</h4>
     <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="idegzaminu" DataValueField="idegzaminu">
     </asp:DropDownList>
     <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDvHistoriaDropList %>" SelectCommand="SELECT [idegzaminu] FROM [historia]"></asp:SqlDataSource>
    <br />
    <h4> Dane konkretnego zapisu</h4>
     <asp:DetailsView ID="DetailsView3" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource8" Height="50px" Width="125px">
         <Fields>
             <asp:BoundField DataField="idegzaminu" HeaderText="idegzaminu" SortExpression="idegzaminu" />
             <asp:BoundField DataField="PKK" HeaderText="PKK" SortExpression="PKK" />
             <asp:BoundField DataField="wynik_egz" HeaderText="wynik_egz" SortExpression="wynik_egz" />
             <asp:BoundField DataField="koszt_egz" HeaderText="koszt_egz" SortExpression="koszt_egz" />
             <asp:BoundField DataField="znak_egz" HeaderText="znak_egz" SortExpression="znak_egz" />
         </Fields>
     </asp:DetailsView>
     <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORD_Historia %>" SelectCommand="SELECT idegzaminu, PKK, wynik_egz, koszt_egz, znak_egz FROM historia WHERE (idegzaminu = @para3)">
         <SelectParameters>
             <asp:ControlParameter ControlID="DropDownList3" Name="para3" PropertyName="SelectedValue" />
         </SelectParameters>
     </asp:SqlDataSource>
    <br />
    <h4> Wyszystkie dane</h4>
    <br />
     <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource9">
         <Columns>
             <asp:BoundField DataField="idegzaminu" HeaderText="idegzaminu" SortExpression="idegzaminu" />
             <asp:BoundField DataField="PKK" HeaderText="PKK" SortExpression="PKK" />
             <asp:BoundField DataField="wynik_egz" HeaderText="wynik_egz" SortExpression="wynik_egz" />
             <asp:BoundField DataField="koszt_egz" HeaderText="koszt_egz" SortExpression="koszt_egz" />
             <asp:BoundField DataField="znak_egz" HeaderText="znak_egz" SortExpression="znak_egz" />
         </Columns>
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDv3 %>" SelectCommand="SELECT * FROM [historia]"></asp:SqlDataSource>
    <br />
    </asp:Content>
