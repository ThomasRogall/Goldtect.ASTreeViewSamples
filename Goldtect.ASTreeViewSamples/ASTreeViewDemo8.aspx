<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemo8.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemo8" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>

<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo8</title>
	<link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
	<link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
	
	<script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
	<script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    
    	<uc1:Header id="Header1" runat="server"></uc1:Header>
		<h2>ExpandDepth Demo (initial depth is <%=this.astvMyTree.ExpandDepth %>)</h2>
    <div>

		Expand to: <asp:TextBox ID="txtDepth" runat="server" Text="3"></asp:TextBox><asp:Button ID="btnExpandToDepth" CssClass="button" runat="server" Text="Expand" OnClick="btnExpandToDepth_Click" /> 
		<asp:Button ID="btnPostBackTest" CssClass="button" runat="server" Text="Test Postbak" OnClick="btnPostBackTest_Click" />
		
    </div>
    <div>
		<table>
			<tr valign="top">
				<td width="400">
					<astv:ASTreeView ID="astvMyTree" 
						runat="server"
						BasePath="~/Scripts/astreeview/"
						DataTableRootNodeValue="0"
						EnableRoot="true" 
						EnableNodeSelection="true" 
						EnableCheckbox="true" 
						EnableDragDrop="false" 
						EnableTreeLines="true"
						EnableNodeIcon="true"
						EnableCustomizedNodeIcon="false"
						AutoPostBack="false"
						EnableDebugMode="false"
						EnableContextMenu="false"
						ExpandDepth="2" />
							
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
