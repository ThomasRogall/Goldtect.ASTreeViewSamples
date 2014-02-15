<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemo16.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemo16" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>
<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo16</title>
	<link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
	<link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
	
	<script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
	<script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
	<script type="text/javascript">

		//parameter must be "elem"
		function dndStartHandler(elem) {
			document.getElementById("<%=divConsole.ClientID %>").innerHTML
			+= (">>drag started. [Node]" + elem.getAttribute("treeNodeValue")
			+ " [Parent]:" + elem.parentNode.parentNode.getAttribute("treeNodeValue")
			+ "<br />");
		}

		//parameter must be "elem"
		function dndCompletingHandler(elem) {
			document.getElementById("<%=divConsole.ClientID %>").innerHTML
			+= (">>drag completing. [Node]" + elem.getAttribute("treeNodeValue")
			+ " [Parent]:" + elem.parentNode.parentNode.getAttribute("treeNodeValue")
			+ "<br />");
		}
		
	</script>
</head>
<body>
    <form id="form1" runat="server">
    
	<uc1:Header id="Header1" runat="server"></uc1:Header>
	<h2>General Tree </h2>
    <div>
				<asp:Button ID="btnToggleDragDrop" CssClass="button" runat="server" Text="EnableDragDrop" OnClick="btnToggleDragDrop_Click" />
				<asp:Button ID="btnToggleNodeIcon" CssClass="button" runat="server" Text="DisableNodeIcon" OnClick="btnToggleNodeIcon_Click" />
				<asp:Button ID="btnToggleCheckbox" CssClass="button" runat="server" Text="EnableCheckbox" OnClick="btnToggleCheckbox_Click" />
				<asp:Button ID="btnToggleDefaultNodeIcon" CssClass="button" runat="server" Text="UseDefaultNodeIcon" OnClick="btnToggleDefaultNodeIcon_Click"  />
				<asp:Button ID="btnGetTreeViewXML" CssClass="button" runat="server" Text="GetTreeViewXML" OnClick="btnGetTreeViewXML_Click" />
				<asp:Button ID="btnToggleThreeStateCheckbox" CssClass="button" runat="server" Text="EnableThreeStateCheckbox" OnClick="btnToggleThreeStateCheckbox_Click" />
				<br />
				<asp:CheckBox ID="cbIncludeHalfChecked" CssClass="no-border" runat="server" Text="IncludeHalfChecked" /> <asp:Button ID="btnGetCheckedNodes" CssClass="button" runat="server" Text="GetCheckedNodes" OnClick="btnGetCheckedNodes_Click" />

    </div>
    
    <div style="float:left;">
		<astv:ASTreeView ID="astvMyTree" 
				runat="server"
				BasePath="~/Scripts/astreeview/"
				DataTableRootNodeValue="0"
				EnableRoot="false" 
				EnableNodeSelection="false" 
				EnableCheckbox="true" 
				EnableDragDrop="true" 
				EnableTreeLines="true"
				EnableNodeIcon="true"
				EnableCustomizedNodeIcon="false"
				EnableContextMenu="true"
				EnableDebugMode="false"
				EnableContextMenuAdd="false"
				OnNodeDragAndDropCompletingScript="dndCompletingHandler( elem )"
				OnNodeDragAndDropStartScript="dndStartHandler( elem )"
				EnableMultiLineEdit="false"
				EnableEscapeInput="false"
				EnableDragDropOnIcon="true" />
    </div>
    
    <div id="divConsole" runat="server"></div>
	<iframe name="frm" frameborder="0" width="300" height="300" scrolling="no"></iframe>
    </form>
</body>
</html>
