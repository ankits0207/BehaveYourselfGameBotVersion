<%@ Page Title="" Language="C#" MasterPageFile="~/BehaveYourself.Master" AutoEventWireup="true" CodeBehind="Leaderboard.aspx.cs" Inherits="BehaveYourself.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .auto-style7 {
            text-align: center;
            font-family: "Sitka Text";
            font-size: medium;
            background-color: #FFFFCC;
            width: 800px;
        }
        .auto-style11 {
            font-family: "Sitka Text";
            font-size: small;
            font-weight: bold;
        }
        .auto-style5 {
            text-align: center;
            background-color: #FFFFCC;
        }
        .auto-style6 {
            font-family: "Sitka Text";
            font-size: medium;
        }
        .auto-style9 {
            font-family: "Sitka Text";
            font-size: medium;
            color: #008000;
        }
        .auto-style10 {
            font-family: "Sitka Text";
            font-size: medium;
            color: #800000;
        }
        .auto-style12 {
            text-align: center;
            font-family: "Sitka Text";
            font-size: medium;
            background-color: #FFFFCC;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContentPlaceholder" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style7"><strong>
                <asp:Button ID="btnstart" runat="server" CssClass="auto-style11" Text="Skip to game" OnClick="btnstart_Click" />
                </strong></td>
            <td class="auto-style5"><strong>
                <asp:Label ID="Label1" runat="server" CssClass="auto-style6" Text="Welcome"></asp:Label>
                <span class="auto-style6">&nbsp;</span><asp:Label ID="lbluid" runat="server" CssClass="auto-style9" Text="Label"></asp:Label>
                <br />
                <asp:LinkButton ID="btnlogout" runat="server" CssClass="auto-style10" OnClick="btnlogout_Click">Logout</asp:LinkButton>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="2">
                <asp:GridView ID="gvrank" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <SortedAscendingCellStyle BackColor="#FDF5AC" />
                    <SortedAscendingHeaderStyle BackColor="#4D0000" />
                    <SortedDescendingCellStyle BackColor="#FCF6C0" />
                    <SortedDescendingHeaderStyle BackColor="#820000" />
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
