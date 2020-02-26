<%@ Page Title="" Language="C#" MasterPageFile="~/BehaveYourself.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BehaveYourself.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            font-weight: bold;
            font-size: large;
            font-family: "Courier New", Courier, monospace;
            color: #333300;
            text-align: center;
            background-color: #FFFFCC;
        }
        .auto-style5 {
            font-family: "Segoe UI Semibold";
        }
        .auto-style6 {
            font-size: small;
            color: #FF3300;
        }
        .auto-style7 {
            font-weight: bold;
            font-size: large;
            font-family: "Courier New", Courier, monospace;
            color: #333300;
            text-align: center;
            height: 35px;
            background-color: #FFFFCC;
        }
        .auto-style8 {
            font-size: large;
            font-family: "Segoe UI Semibold";
            color: #333300;
            text-align: center;
            background-color: #FFFFCC;
        }
        .auto-style9 {
            font-size: large;
            font-family: "Segoe UI Semibold";
            color: #333300;
            text-align: center;
            height: 35px;
            background-color: #FFFFCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContentPlaceholder" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style8" colspan="3">LOGIN TO PLAY</td>
        </tr>
        <tr>
            <td class="auto-style8">Username</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtuname" runat="server" CssClass="auto-style5"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:RequiredFieldValidator ID="valuname" runat="server" ControlToValidate="txtuname" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">Password</td>
            <td class="auto-style7">
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" CssClass="auto-style5"></asp:TextBox>
            </td>
            <td class="auto-style9">
                <asp:RequiredFieldValidator ID="valpwd" runat="server" ControlToValidate="txtpwd" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Session ID</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtsessid" runat="server" CssClass="auto-style5"></asp:TextBox>
            </td>
            <td class="auto-style8">
                <asp:RequiredFieldValidator ID="valsessid" runat="server" ControlToValidate="txtsessid" ErrorMessage="*" ForeColor="#CC3300"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="2">
                <strong>
                <asp:Label ID="lblmsg" runat="server" CssClass="auto-style6" ForeColor="#FF3300" Text="Message from admin"></asp:Label>
                </strong>
            </td>
            <td class="auto-style4"><strong>
                <asp:Button ID="btnlogin" runat="server" CssClass="auto-style5" OnClick="btnlogin_Click" Text="Login" Width="140px"/>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style8" colspan="3">
                Behave Yourself team: Manasi Malik, Shreyash Arya, Dinesh Jain, Shashee Kumari and Ankit Sharma</td>
        </tr>
    </table>
</asp:Content>
