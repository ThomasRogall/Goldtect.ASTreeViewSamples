<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdatePanelSample.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.UpdatePanelDemo.UpdatePanelSample" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Update Panel Demo</title>
    
    <link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
    
    <script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
    
    <div>
        <asp:ScriptManager ID="sm" runat=server></asp:ScriptManager>
        <asp:UpdatePanel ID="upPanel1" runat="server" UpdateMode=Conditional>
            <ContentTemplate>
                <asp:Button ID="btnGenereateTree" CssClass="button" runat="server" Text="GenereateTree" OnClick="btnGenereateTree_Click" />
                <asp:Button ID="btnHideOutSide" CssClass="button" runat="server" Text="HideOutSide" OnClick="btnHideOutSide_Click" />
                <asp:Button ID="btnShowOutSide" CssClass="button" runat="server" Text="ShowOutSide" OnClick="btnShowOutSide_Click" />
                <asp:Button ID="btnGetTreeViewXML" CssClass="button" runat="server" Text="GetTreeViewXML" OnClick="btnGetTreeViewXML_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    <div>
        <asp:UpdatePanel ID="upPanel2" runat="server" UpdateMode=Conditional>
            <ContentTemplate>
                <table>
                    <tr valign="top">
                        <td width="400">
                            
                            <asp:Button ID="btnShow" CssClass="button" runat="server" Text="Show" OnClick="btnShow_Click" />
                            <asp:Button ID="btnHide" CssClass="button" runat="server" Text="Hide" OnClick="btnHide_Click" />
                            
                            <astv:ASTreeView ID="astvMyTree" 
                                runat="server"
                                BasePath="~/Scripts/astreeview/"
                                DataTableRootNodeValue="0"
                                EnableRoot="false" 
                                EnableNodeSelection="true" 
                                EnableCheckbox="true" 
                                EnableDragDrop="true" 
                                EnableTreeLines="true"
                                EnableNodeIcon="true"
                                EnableCustomizedNodeIcon="false"
                                EnableDebugMode="false"
                                EnableContextMenuAdd="false"
                                EnableParentNodeExpand="true"
                                Visible="false" />
                            
                        </td>
                        <td>
                            <div id="divConsole" runat="server"></div>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
            
    </form>
</body>
</html>
