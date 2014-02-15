<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemo17.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemo17" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>

<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo17</title>
	<link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
	<link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
	
	<script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
	<script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
	
	<script type="text/javascript">
		//parameter must be "elem"
		function addedHandler(elem) {
			var message = '';
			var result = true;

			var aTag = elem.getElementsByTagName('A')[0];

			if (aTag.getAttribute('addfailed') == 'true') {
				alert(aTag.innerHTML);
				return false;
			}
			else {
				message = (">>add completed. [Node]" + elem.getAttribute("treeNodeValue") + "<br />");
			}


			document.getElementById("<%=divConsole.ClientID %>").innerHTML += message;
			return result;

		}

		//parameter must be "elem" and "info"
		function editedHandler(elem, info) {
			//console.debug(info)
			var ts = info.split('|');
			if (ts[0] == '1') {
				alert(ts[1]);
				return false;
			}

			document.getElementById("<%=divConsole.ClientID %>").innerHTML
			+= (">>edit completed. [Node]" + elem.getAttribute("treeNodeValue")
			+ "<br />");
		}

		//parameter must be "val" and "info"
		function deletedHandler(val, info) {
			//console.debug(info)
			var ts = info.split('|');
			if (ts[0] == '1') {
				alert(ts[1]);
				return false;
			}

			document.getElementById("<%=divConsole.ClientID %>").innerHTML
			+= (">>delete completed. [Node]" + val
			+ "<br />");
		}

		//parameter must be "elem"
		function dndStartHandler(elem) {
			var nText = elem.getElementsByTagName("A")[0].innerHTML;

			if (nText.indexOf('a') < 0 && nText.indexOf('A') < 0) {//elem.getAttribute("treeNodeValue") != 'Tesorus' ){
				document.getElementById("<%=divConsole.ClientID %>").innerHTML
				+= (">>drag started. [Node]" + elem.getAttribute("treeNodeValue")
				+ " [Parent]:" + elem.parentNode.parentNode.getAttribute("treeNodeValue")
				+ "<br />");

				return true;
			}
			else {
				var script = 'alert("You cannot drag and drop a node with \'a\' in node text.")';
				window.setTimeout(script, 50);
				return false;
			}
		}

		//parameter must be "elem"
		function dndCompletingHandler(elem, newParent) {
			var nText = newParent.getElementsByTagName("A")[0].innerHTML;

			if (nText.indexOf('a') < 0 && nText.indexOf('A') < 0) {
				document.getElementById("<%=divConsole.ClientID %>").innerHTML
				+= (">>drag completing. [Node]" + elem.getAttribute("treeNodeValue")
				+ " [Parent]:" + newParent.getAttribute("treeNodeValue")
				+ "<br />");

				return true;
			}
			else {
				alert("You cannot drop the node under a node with 'a' in node text.");
				return false;
			}
		}
	</script>
</head>
<body>
    <form id="form1" runat="server">
    	<uc1:Header id="Header1" runat="server"></uc1:Header>
		<h2>Advance Client Side JS</h2>
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
							EnableTreeLines="true"
							EnableNodeIcon="true"
							EnableCustomizedNodeIcon="false"
							AutoPostBack="false"
							EnableDebugMode="false"
							EnableContextMenu="true"
							EnableAjaxOnEditDelete="true"
							EditNodeProvider="~/ASTreeViewDemo/ASTreeViewEditNodeHandler.aspx"
							DeleteNodeProvider="~/ASTreeViewDemo/ASTreeViewDeleteNodeProviderLimit.aspx"
							AddNodeProvider="~/ASTreeViewDemo/ASTreeViewDemo17.aspx"
							AdditionalAddRequestParameters="{'t':'ajaxAdd'}"
							AddNodePromptDefaultValue="New Node" 
							AddNodePromptMessage="Hello, please add a new node:"
							AddNodeDataValueProvider="return prompt('new node? under:' + elem.getAttribute('treeNodeValue') + ' Text with letter a will be rejected.','');"
							OnNodeAddedScript="addedHandler(elem)"
							EnableOnNodeAddedScriptReturn="true"	
							OnNodeEditedScript="editedHandler(elem, info)"
							EnableOnNodeEditedScriptReturn="true"
							OnNodeDeletedScript="deletedHandler(val, info)"
							EnableOnNodeDeletedScriptReturn="true"
							OnNodeDragAndDropCompletingScript="dndCompletingHandler( elem, newParent )"
							OnNodeDragAndDropStartScript="dndStartHandler( elem )"
							EnableOnNodeDragAndDropStartScriptReturn="true"
							EnableOnNodeDragAndDropCompletingScriptReturn="true" />
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
