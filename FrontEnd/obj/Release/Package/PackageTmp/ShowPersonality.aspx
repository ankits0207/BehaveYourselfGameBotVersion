<%@ Page Title="" Language="C#" MasterPageFile="~/BehaveYourself.Master" AutoEventWireup="true" CodeBehind="ShowPersonality.aspx.cs" Inherits="BehaveYourself.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-weight: bold;
            font-size: medium;
            color: #008080;
        }
        .auto-style7 {
            color: #CC0000;
            font-family: "Franklin Gothic Medium";
            font-size: x-large;
        }
        .auto-style8 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-weight: bold;
            font-size: medium;
            color: #008080;
            text-align: center;
        }
        .auto-style12 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-weight: bold;
            font-size: medium;
            color: #008080;
            text-align: left;
            background-color: #CCFFFF;
            height: 45px;
        }
        .auto-style20 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-weight: bold;
            font-size: medium;
            color: #333300;
            text-align: center;
        }
        .auto-style21 {
            font-family: "Segoe UI Symbol";
            font-weight: bold;
            color: #808000;
        }
        .auto-style22 {
            font-family: "Franklin Gothic Medium";
            font-weight: bold;
            font-size: x-large;
            color: #008080;
        }
        .auto-style23 {
            width: 1259px;
        }
        .auto-style24 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-weight: bold;
            font-size: medium;
            color: #008080;
            text-align: left;
            background-color: #CCFFFF;
            height: 45px;
            width: 314px;
        }
        .auto-style26 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            font-weight: bold;
            font-size: medium;
            color: #008080;
            text-align: left;
            background-color: #CCFFFF;
            height: 45px;
            width: 315px;
        }
        .auto-style27 {
            color: #CC0000;
        }
        .auto-style28 {
            color: #0033CC;
        }
        .auto-style29 {
            color: #CC6600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContentPlaceholder" runat="server">
    <table class="auto-style23">
        <tr>
            <td class="auto-style4" colspan="4"><span class="auto-style22">You just made your last move for the match and you have been logged out.</span><br class="auto-style22" />
                <span class="auto-style22">Your final score: </span>
                <asp:Label ID="lblscore" runat="server" Text="Label" CssClass="auto-style7"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="4">Some insights into your personality!</td>
        </tr>
        <tr>
            <td class="auto-style24">Optimist -
                <asp:Label ID="Label1" runat="server" Text="Label" CssClass="auto-style27"></asp:Label>
            &nbsp;%</td>
            <td class="auto-style24">Pessimist -
                <asp:Label ID="Label2" runat="server" Text="Label" CssClass="auto-style28"></asp:Label>
            &nbsp;%</td>
            <td class="auto-style24">Envious -
                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            &nbsp;%</td>
            <td class="auto-style26">Trustful -
                <asp:Label ID="Label4" runat="server" Text="Label" CssClass="auto-style29"></asp:Label>
            &nbsp;%</td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="4">
                <asp:Image ID="Image1" runat="server" Height="828px" ImageUrl="~/PersonalityTypes.jpg" Width="1253px" />
            </td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="4">Leaderboard<br />
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" HorizontalAlign="Center">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
                <strong>
                <br />
                <span class="auto-style4">Keep playing by logging in again to increase your chances of winning.</span><br />
                <br />
                <asp:Button ID="btn_login" runat="server" CssClass="auto-style21" OnClick="btn_login_click" Text="Login again" />
                </strong>
            </td>
        </tr>
        <tr>
            <td class="auto-style20" colspan="4">Thanks for playing. It was a pleasure hosting you :)<br />
                Behave Yourself team: Manasi Malik, Shreyash Arya, Dinesh Jain, Shashee Kumari and Ankit Sharma</td>
        </tr>
    </table>
</asp:Content>
