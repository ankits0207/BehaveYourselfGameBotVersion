<%@ Page Title="" Language="C#" MasterPageFile="~/BehaveYourself.Master" AutoEventWireup="true" CodeBehind="Instructions1.aspx.cs" Inherits="BehaveYourself.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            text-align: center;
            background-color: #FFFFCC;
        }
        .auto-style6 {
            font-family: "Sitka Text";
            font-size: medium;
        }
        .auto-style7 {
            text-align: center;
            font-family: "Sitka Text";
            font-size: medium;
            background-color: #FFFFCC;
        }
        .auto-style8 {
            text-align: center;
            font-size: medium;
            background-color: #FFFFCC;
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
        .auto-style11 {
            font-family: "Sitka Text";
            font-size: small;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContentPlaceholder" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style7"><strong>Instructions 1/3<br />
                <asp:Button ID="btnprev" runat="server" CssClass="auto-style11" Enabled="False" Text="Back" Visible="False" />
                <asp:Button ID="btnskip" runat="server" CssClass="auto-style11" Text="Skip to game" OnClick="btnskip_Click" />
                <asp:Button ID="btnnext" runat="server" CssClass="auto-style11" Text="Next" OnClick="btnnext_Click" />
                </strong></td>
            <td class="auto-style5"><strong><span class="auto-style6">Welcome </span>
                <asp:Label ID="lbluid" runat="server" CssClass="auto-style9" Text="Label"></asp:Label>
                <br />
                <asp:LinkButton ID="btnlogout" runat="server" CssClass="auto-style10" OnClick="btnlogout_Click">Logout</asp:LinkButton>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="2">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Refresh0.jpg" />
            </td>
        </tr>
    </table>
</asp:Content>
