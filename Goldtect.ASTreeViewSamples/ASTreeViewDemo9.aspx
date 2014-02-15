<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemo9.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemo9" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>

<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo9</title>
	<link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
	<link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
	
	<script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
	<script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    
    	<uc1:Header id="Header1" runat="server"></uc1:Header>
		<h2>Resolve Changes</h2>
    <div>
		<asp:Button ID="btnClearConsole" CssClass="button" runat="server" Text="Clear Console" OnClick="btnClearConsole_Click" />
		<asp:Button ID="btnIterateNodes" CssClass="button" runat="server" Text="Iterate Nodes" OnClick="btnIterateNodes_Click" />
		<asp:Button ID="btnTraverseNodes" CssClass="button" runat="server" Text="Traverse Nodes" OnClick="btnTraverseNodes_Click" />
		<asp:Button  ID="btnResolveNodesModification" CssClass="button" runat="server" Text="ResolveNodesModification" OnClick="btnResolveNodesModification_Click" />
		<br />
		<asp:Literal ID="lTarget" Text="Target" runat="server"></asp:Literal> <asp:TextBox ID="txtTarget" runat="server" CssClass="text"></asp:TextBox>
		<asp:Button ID="btnFindByValue" CssClass="button" runat="server" Text="FindByValue" OnClick="btnFindByValue_Click" />
		<asp:Button ID="btnFindByText" CssClass="button" runat="server" Text="FindByText" OnClick="btnFindByText_Click" />
		
		<asp:Button ID="btnSelectByValue" CssClass="button" runat="server" Text="SelectByValue" OnClick="btnSelectByValue_Click" />
		<asp:Button ID="btnCheckByValue" CssClass="button" runat="server" Text="CheckByValue" OnClick="btnCheckByValue_Click" /><asp:Button ID="btnUnCheckByValue" CssClass="button" runat="server" Text="UnCheckByValue" OnClick="btnUnCheckByValue_Click" /><asp:Literal ID="lPromptComma" Text="PromptComma" runat="server"></asp:Literal>
	
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
						EnableDragDrop="true" 
						EnableTreeLines="false"
						EnableNodeIcon="true"
						EnableCustomizedNodeIcon="false"
						AutoPostBack="false"
						EnableDebugMode="false"
						EnableContextMenu="true"
						EnableContextMenuAdd="false" />
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
