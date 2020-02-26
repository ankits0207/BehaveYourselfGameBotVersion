<%@ Page Title="" Language="C#" MasterPageFile="~/BehaveYourself.Master" AutoEventWireup="true" CodeBehind="GamePageTemp.aspx.cs" Inherits="BehaveYourself.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style6 {
        text-align: center;
        font-size: medium;
        color: #666666;
    }
    .auto-style9 {
        font-family: "Segoe UI Symbol";
        color: #008080;
            font-size: medium;
        }
    .auto-style11 {
        text-align: center;
        width: 183px;
        color: #333333;
        background-color: #CCFFFF;
    }
    .auto-style14 {
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        color: #333333;
    }
    .auto-style21 {
            text-align: center;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            color: #333333;
            background-color: #FFFFCC;
            height: 45px;
        }
    .auto-style30 {
        text-align: center;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        color: #333333;
        height: 45px;
        background-color: #CCFFFF;
    }
    .auto-style33 {
        text-align: center;
        font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
        color: #333333;
        background-color: #FFFFFF;
    }
    .auto-style34 {
        font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
        color: #666633;
    }
    .auto-style35 {
        font-family: Cambria, Cochin, Georgia, Times, "Times New Roman", serif;
        color: #0000FF;
    }
        .auto-style4 {
        font-family: "Segoe UI Symbol";
        font-size: medium;
        font-weight: bold;
        }
        .auto-style49 {
            font-size: xx-large;
            font-family: Arial, Helvetica, sans-serif;
            color: #FF0000;
        }
    .auto-style7 {
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        color: #666666;
    }
        .auto-style50 {
            height: 150px;
        }
        .auto-style57 {
            text-align: center;
            background-color: #FFCCFF;
            font-size: large;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        }
        .auto-style79 {
            width: 1271px;
        }
        .auto-style92 {
            text-align: center;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            color: #333333;
            background-color: #E3E3FF;
            width: 212px;
        }
        .auto-style94 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            color: #990033;
            height: 65px;
            width: 635px;
        }
        .auto-style96 {
            color: #0033CC;
        }
        .auto-style97 {
            text-align: center;
            font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande", "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
            color: #333333;
            height: 80px;
            width: 268px;
            background-color: #FFFFCC;
            height: 29px;
        }
        .auto-style98 {
            text-align: center;
            background-color: #D4D4D4;
            height: 29px;
            width: 212px;
        }
        .auto-style99 {
            font-family: "Segoe UI Symbol";
            font-size: medium;
            color: #990033;
            height: 65px;
            width: 634px;
        }
        .auto-style100 {
            font-family: "Segoe UI Symbol";
        }
        .auto-style46 {
            font-family: Arial, Helvetica, sans-serif;
            color: #CC0000;
        }
        .auto-style47 {
            font-family: Arial, Helvetica, sans-serif;
            color: #0000FF;
            }
        .auto-style101 {
            font-size: medium;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MyContentPlaceholder" runat="server">
    <table class="auto-style50" align = "center" valign = "middle">
        <tr>
            <td colspan="6" class="auto-style2"><strong>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel2">
                    <ProgressTemplate>
                        <span class="auto-style49">Waiting for your opponent&#39;s move...</span><br />
                        <asp:Image ID="Image1" runat="server" Height="85px" ImageUrl="~/loader.gif" Width="90px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                </strong>
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <strong>
                        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick1">
                        </asp:Timer>
                        </strong>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <span class="auto-style34"><strong>Remaining time: </strong></span><strong>
                        <asp:Label ID="lbltime" runat="server" CssClass="auto-style35" Text="-"></asp:Label>
                        &nbsp;</strong>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td class="auto-style57" colspan="6"><strong __designer:mapid="13">
                <div>
                    <table class="auto-style79">
                        <tr>
                            <td class="auto-style99"><strong __designer:mapid="13">
                <span class="auto-style46">Your total score: 
                </span>
                <asp:Label ID="lbltotscore" runat="server" Text="Score" CssClass="auto-style47"></asp:Label>
                </strong>
                            </td>
                            <td class="auto-style94"><strong __designer:mapid="13">
                                <span class="auto-style100">
                                Previous round summary:
                                <br />
                                <asp:Label ID="lbl_summary" runat="server" CssClass="auto-style96"></asp:Label>
                                </span>
                </strong>
                            </td>
                        </tr>
                        </table>
                </div>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style33" colspan="2" rowspan="3"><strong __designer:mapid="13">
                <span class="auto-style101">Your Opponent:</span><br class="auto-style101" />
                <asp:Label ID="lblopponent" runat="server" CssClass="auto-style9" Text="Opponent"></asp:Label>
                </strong>
            </td>
            <td class="auto-style30" colspan="4"><strong>Opponent&#39;s move</strong></td>
        </tr>
        <tr>
            <td class="auto-style21" colspan="2"><strong>Cooperate</strong></td>
            <td class="auto-style21" colspan="2"><strong>Don&#39;t&nbsp;&nbsp; Cooperate</strong></td>
        </tr>
        <tr>
            <td class="auto-style92"><strong>You get</strong></td>
            <td class="auto-style92"><strong>Opponent gets</strong></td>
            <td class="auto-style92"><strong>You get</strong></td>
            <td class="auto-style92"><strong>Opponent gets</strong></td>
        </tr>
        <tr>
            <td class="auto-style11" rowspan="2"><span class="auto-style14"><strong>
                Y</strong></span><strong><br class="auto-style14" />
                o<br class="auto-style14" />
                u<br class="auto-style14" />
                r<br class="auto-style14" />
                <br class="auto-style14" />
                m<br class="auto-style14" />
                o<br class="auto-style14" />
                v<br class="auto-style14" />
                </strong><span class="auto-style14"><strong>e</strong></span></td>
            <td class="auto-style97"><strong>Cooperate</strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label1" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label2" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label3" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label4" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style97"><strong>Dont cooperate</strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label5" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label6" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label7" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
            <td class="auto-style98"><strong>
                <asp:Label ID="Label8" runat="server" CssClass="auto-style14" Text="Label"></asp:Label>
                </strong></td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="6">
                <strong>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <strong>
                        <asp:RadioButtonList ID="rblaction" runat="server" align="center" CssClass="auto-style7" OnSelectedIndexChanged="rblaction_SelectedIndexChanged" Width="336px">
                            <asp:ListItem Value="c">Cooperate</asp:ListItem>
                            <asp:ListItem Value="d">Dont cooperate</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:Button ID="btnsubmit" runat="server" CssClass="auto-style4" Enabled="True" Height="35px" OnClick="btnsubmit_Click" Text="Submit" Width="100px" Visible="false" UseSubmitBehavior="false" OnClientClick="this.disabled='true';"/>
                        </strong>
                    </ContentTemplate>
                </asp:UpdatePanel>
                </strong>
            </td>
        </tr>
    </table>
</asp:Content>
