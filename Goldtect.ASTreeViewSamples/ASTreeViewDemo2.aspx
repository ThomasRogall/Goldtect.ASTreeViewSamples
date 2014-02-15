<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemo2.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemo2" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>

<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo2</title>
	<link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
	<link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
	
	<script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
	<script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    
    	<uc1:Header id="Header1" runat="server"></uc1:Header>
		<h2>Server-side check select event </h2>
    <div>
		<asp:Button ID="btnToggleAutoPostback" CssClass="button" runat="server" Text="EnableAutoPostback" OnClick="btnToggleAutoPostback_Click" />
		<asp:Button ID="btnGetSelectedNode" CssClass="button" runat="server" Text="GetSelectedNode" OnClick="btnGetSelectedNode_Click" />
		<asp:Checkbox ID="cbIncludeHalfChecked" CssClass="no-border" runat="server" Text="IncludeHalfChecked" /> <asp:Button ID="btnGetCheckedNodes" CssClass="button" runat="server" Text="GetCheckedNodes" OnClick="btnGetCheckedNodes_Click" />
			
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
						EnableCheckbox="true" 
						EnableDragDrop="false" 
						EnableTreeLines="true"
						EnableNodeIcon="true"
						EnableCustomizedNodeIcon="false"
						AutoPostBack="true"
						EnableDebugMode="false"
						EnableContextMenu="false"
						OnOnCheckedNodeChanged="astvMyTree_OnCheckedNodeChanged" OnOnSelectedNodeChanged="astvMyTree_OnSelectedNodeChanged" />
							
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
