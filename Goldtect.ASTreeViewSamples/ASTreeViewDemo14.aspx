<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemo14.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemo14" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>

<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo14</title>
    <link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
    
    <script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
    <style type="text/css">
        .astreeview-tree li, .drag-container li {
            background:url(<%=ResolveUrl("~/Scripts/astreeview/images/astreeview-li-bg.jpg")%>) repeat-x;
            cursor:pointer;
            margin-top:2px;
            margin-bottom:2px;
        }
        
        .astreeview-tree li a:hover, .drag-container li a:hover{
            border-bottom:0px;
        }
        .astreeview-tree ul {
            
        }
        
        .astreeview-tree{
            width:280px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
        <uc1:Header id="Header1" runat="server"></uc1:Header>
        <h2> Advanced Drag and Drop</h2>
    <div>
        <asp:Button ID="btnEnableHorizontalLock" CssClass="button" runat="server" Text="EnableHorizontalLock" OnClick="btnEnableHorizontalLock_Click" />
        <asp:Button ID="btnEnableContainerDragDrop" CssClass="button" runat="server" Text="EnableContainerDragDrop" OnClick="btnEnableContainerDragDrop_Click" />
        <asp:Button ID="btnEnableFixedDepthDragDrop" CssClass="button" runat="server" Text="EnableFixedDepthDragDrop" OnClick="btnEnableFixedDepthDragDrop_Click" />
        <asp:Button ID="btnEnableFixedParentDragDrop" CssClass="button" runat="server" Text="EnableFixedParentDragDrop" OnClick="btnEnableFixedParentDragDrop_Click" />
                        
    </div>
    <div>
        <table>
            <tr valign="top">
                <td width="400">
                    <astv:ASTreeView ID="astvMyTree" 
                        runat="server"
                        BasePath="~/Scripts/astreeview/"
                        DataTableRootNodeValue="0"
                        EnableRoot="false" 
                        EnableNodeSelection="true" 
                        EnableCheckbox="false" 
                        EnableDragDrop="true" 
                        EnableTreeLines="false"
                        EnableNodeIcon="true"
                        EnableCustomizedNodeIcon="false"
                        EnableDebugMode="false"
                        EnableContextMenuAdd="false"
                        EnableParentNodeExpand="true"
                        EnableFixedDepthDragDrop="true"
                        EnableHorizontalLock="true"
                        EnableContainerDragDrop="true" />
                </td>
                <td>
                
                    <div id="divConsole" runat="server"></div>
                </td>
            </tr>
        </table>
                
    </div>
    
    </form>
</body>
</html>
