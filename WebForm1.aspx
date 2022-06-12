<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WiktorGórski_Projekt.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
    Witam na stronie egzaminacyjnej PORD, prosze wprowadzić dane do egzaminu.
        </h1>
    <h5>
    Aby wprowadzić swoje dane prosze kliknąć nowy.</h5>
    <h3>
        Dane użytkownika:
    </h3>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="PKK" DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="PKK" HeaderText="PKK" ReadOnly="True" SortExpression="PKK" />
            <asp:BoundField DataField="pesel" HeaderText="pesel" SortExpression="pesel" />
            <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
            <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
            <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
            <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
            <asp:BoundField DataField="OKS" HeaderText="OKS" SortExpression="OKS" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <br />
    <h3>
        Dane do egzaminu:
    </h3>
    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="50px" Width="125px" DataKeyNames="idegzaminu">
        <Fields>
            <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
            <asp:BoundField DataField="godzina" HeaderText="godzina" SortExpression="godzina" />
            <asp:BoundField DataField="PKK" HeaderText="PKK" SortExpression="PKK" />
            <asp:BoundField DataField="idegzaminu" HeaderText="idegzaminu" InsertVisible="False" ReadOnly="True" SortExpression="idegzaminu" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="PKK" DataSourceID="SqlDataSource1" Enabled="False" Visible="False">
        <Columns>
            <asp:BoundField DataField="PKK" HeaderText="PKK" ReadOnly="True" SortExpression="PKK" />
            <asp:BoundField DataField="pesel" HeaderText="pesel" SortExpression="pesel" />
            <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
            <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
            <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
            <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
            <asp:BoundField DataField="OKS" HeaderText="OKS" SortExpression="OKS" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDv1 %>" SelectCommand="SELECT * FROM [kursanci]" DeleteCommand="DELETE FROM [kursanci] WHERE [PKK] = @PKK" InsertCommand="INSERT INTO [kursanci] ([PKK], [pesel], [imie], [nazwisko], [miasto], [adres], [OKS]) VALUES (@PKK, @pesel, @imie, @nazwisko, @miasto, @adres, @OKS)" UpdateCommand="UPDATE [kursanci] SET [pesel] = @pesel, [imie] = @imie, [nazwisko] = @nazwisko, [miasto] = @miasto, [adres] = @adres, [OKS] = @OKS WHERE [PKK] = @PKK">
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
    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="idegzaminu" Visible="False">
        <Columns>
            <asp:BoundField DataField="rodzaj" HeaderText="rodzaj" SortExpression="rodzaj" />
            <asp:BoundField DataField="data" HeaderText="data" SortExpression="data" />
            <asp:BoundField DataField="godzina" HeaderText="godzina" SortExpression="godzina" />
            <asp:BoundField DataField="PKK" HeaderText="PKK" SortExpression="PKK" />
            <asp:BoundField DataField="idegzaminu" HeaderText="idegzaminu" InsertVisible="False" ReadOnly="True" SortExpression="idegzaminu" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:WiktorGórskiPORDv2 %>" SelectCommand="SELECT [rodzaj], [data], [godzina], [PKK], [idegzaminu] FROM [egzaminy]" DeleteCommand="DELETE FROM [egzaminy] WHERE [idegzaminu] = @idegzaminu" InsertCommand="INSERT INTO [egzaminy] ([rodzaj], [data], [godzina], [PKK]) VALUES (@rodzaj, @data, @godzina, @PKK)" UpdateCommand="UPDATE [egzaminy] SET [rodzaj] = @rodzaj, [data] = @data, [godzina] = @godzina, [PKK] = @PKK WHERE [idegzaminu] = @idegzaminu">
        <DeleteParameters>
            <asp:Parameter Name="idegzaminu" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="rodzaj" Type="String" />
            <asp:Parameter DbType="Date" Name="data" />
            <asp:Parameter Name="godzina" DbType="Time" />
            <asp:Parameter Name="PKK" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="rodzaj" Type="String" />
            <asp:Parameter DbType="Date" Name="data" />
            <asp:Parameter Name="godzina" DbType="Time" />
            <asp:Parameter Name="PKK" Type="String" />
            <asp:Parameter Name="idegzaminu" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
     <h3>
         &nbsp;</h3>
    </asp:Content>
