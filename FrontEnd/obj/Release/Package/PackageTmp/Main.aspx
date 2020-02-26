<%@ Page Title="" Language="C#" MasterPageFile="~/BehaveYourself.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="BehaveYourself.WebForm5" %>
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
        .auto-style14 {
            font-family: "Segoe UI Semibold";
            font-weight: bold;
            color: #CC0000;
        }
        .auto-style13 {
            color: #800080;
            font-weight: bold;
        }
        .auto-style15 {
            text-align: center;
            font-family: "Segoe UI Symbol";
            font-size: medium;
            background-color: #FFFFCC;
        }
        .auto-style17 {
            font-family: "Segoe UI Symbol";
            color: #800080;
            font-weight: bold;
        }
        .auto-style18 {
            font-family: "Segoe UI Symbol";
        }
        .auto-style21 {
            font-family: "Segoe UI Semibold";
            color: #CC0000;
        }
        .auto-style22 {
            width: 100%;
        }
        .auto-style23 {
            font-family: "Segoe UI Symbol";
            font-weight: bold;
        }
        .auto-style24 {
            color: #800080;
        }
        .auto-style25 {
            font-family: "Segoe UI Semibold";
            font-weight: bold;
            color: #800080;
        }
        .auto-style26 {
            color: #CC0000;
            font-weight: bold;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContentPlaceholder" runat="server">
    <table class="auto-style22">
        <tr>
            <td class="auto-style7"><strong>
                <br />
                Enter Game id:</strong>
                <asp:TextBox ID="txtgameid" runat="server"></asp:TextBox>
                <strong>
                <br />
                <br />
                <asp:Button ID="btninstructions" runat="server" CssClass="auto-style11" Text="Instructions" OnClick="btninstructions_Click" />
                <asp:Button ID="btnstart" runat="server" CssClass="auto-style11" Text="Start Game" OnClick="btnstart_Click" />
                <asp:Button ID="btnleader" runat="server" CssClass="auto-style11" Text="Leaderboard" OnClick="btnnext_Click" />
                </strong></td>
            <td class="auto-style5"><strong><span class="auto-style6">Welcome </span>
                <asp:Label ID="lbluid" runat="server" CssClass="auto-style9" Text="Label"></asp:Label>
                <br />
                <asp:LinkButton ID="btnlogout" runat="server" CssClass="auto-style10" OnClick="btnlogout_Click">Logout</asp:LinkButton>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="2"><span class="auto-style25">Note: 
                <br />
                </span>
                <span class="auto-style14"><span class="auto-style24"><span class="auto-style18">1. Opponent&#39;s name is masked to ensure fair play.</span></span></span><br class="auto-style25" />
                <span class="auto-style17" style="font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: pre-wrap; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 204); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">2. Leaderboard shows your best score from all the games you’ve played.</span><span class="auto-style23"><br class="auto-style24" />
                </span><span class="auto-style13"><span class="auto-style18">(Play more to increase your chances of being in top 3!)<b><br />
                3. Submit button would be visible when you select a move.</b></span><b><br class="auto-style18" />
                </b>
                </span><span class="auto-style21">
                <span class="auto-style17">4. Multiple timeouts(no response from your side) would lead to forced termination of the match.&nbsp; </span> </span><br class="auto-style17" />
                <span class="auto-style15"><span class="auto-style13">5. In case of any issue, contact </span><span class="auto-style26">9999600207</span><span class="auto-style13"> or </span><span class="auto-style26">9899005628</span><span class="auto-style13">.</span></span></td>
        </tr>
    </table>
</asp:Content>
