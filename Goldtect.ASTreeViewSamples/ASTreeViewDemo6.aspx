<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemo6.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemo6" %>
<%@ Register Src="Header.ascx" TagName="Header" TagPrefix="uc1" %>

<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo6</title>
    <link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Scripts/astreeview/dropdowntreeview.css")%>" type="text/css" rel="stylesheet" />

    <script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
    
    <script type="text/javascript">
        function nodeSelectHandler(elem) {
            var val = "selected node:" + elem.parentNode.getAttribute("treeNodeValue");
            document.getElementById("<%=divConsole.ClientID %>").innerHTML
			+= (">>" + val + "<br />");

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">	
    <uc1:Header id="Header1" runat="server"></uc1:Header>
    <h2>ASTreeView in Dropdown (ASDropDownTree)</h2>
    <div>
        <asp:Button ID="btnGetCheckedNodes" CssClass="button" runat="server" Text="GetCheckedNodes" OnClick="btnGetCheckedNodes_Click" ValidationGroup="vgCheck"/>
        <asp:Button ID="btnGetSelectedNode" CssClass="button" runat="server" Text="GetSelectedNode" OnClick="btnGetSelectedNode_Click" ValidationGroup="vgSelect" />
        <asp:Button ID="btnChangeDropdownText" CssClass="button" runat="server" Text="ChangeDropdownText" OnClick="btnChangeDropdownText_Click" />
        <asp:Button ID="btnToggleCloseOnNodeSelection" CssClass="button" runat="server" Text="EnableCloseOnNodeSelection" OnClick="btnToggleCloseOnNodeSelection_Click" />
        <asp:Button ID="btnToggleEnabled" CssClass="button" runat="server" Text="EnableDropDownTree" OnClick="btnToggleEnabled_Click" />
    </div>
     <div>
        <table>
            <tr valign="top">
                <td width="400">
                    <astv:ASDropDownTreeView ID="astvMyTree" 
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
                                        EnableDebugMode="false"
                                        EnableRequiredValidator="true"
                                        InitialDropdownText="<span style='color:green;'>Please select</span>" 
                                        Width="300"
                                        EnableCloseOnOutsideClick="true" 
                                        EnableHalfCheckedAsChecked="true" 
                                        RequiredValidatorValidationGroup="vgCheck"
                                        EnableContextMenuAdd="false"
                                        MaxDropdownHeight="200"/>
                                <br />
                                <br />
                                <astv:ASDropDownTreeView ID="astvMyTree2" 
                                        runat="server"
                                        BasePath="~/Scripts/astreeview/"
                                        DataTableRootNodeValue="0"
                                        EnableRoot="false" 
                                        EnableNodeSelection="true" 
                                        EnableCheckbox="false" 
                                        EnableDragDrop="false" 
                                        EnableTreeLines="true"
                                        EnableNodeIcon="true"
                                        EnableCustomizedNodeIcon="false"
                                        EnableDebugMode="false"
                                        EnableRequiredValidator="true"
                                        InitialDropdownText="Please select" 
                                        Width="300"
                                        EnableCloseOnOutsideClick="true" 
                                        EnableHalfCheckedAsChecked="true"
                                        RequiredValidatorValidationGroup="vgSelect" 
                                        EnableContextMenuAdd="false" 
                                        EnableCloseOnNodeSelection="true"
						            OnNodeSelectedScript="nodeSelectHandler(elem);"
                                    EnableAjaxOnEditDelete="true"
                                    EnableContextMenuDelete="false"
                                    AddNodeProvider="~/ASTreeViewDemo6.aspx"
                                    AdditionalAddRequestParameters="{'t2':'ajaxAdd'}"
                                    EditNodeProvider="~/ASTreeViewRenameNodeHandler.aspx"
                                    DeleteNodeProvider="~/ASTreeViewDeleteNodeProvider.aspx"
                                    LoadNodesProvider="~/ASTreeViewDemo6.aspx"
                                    AdditionalLoadNodesRequestParameters="{'t1':'ajaxLoad'}" />
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
