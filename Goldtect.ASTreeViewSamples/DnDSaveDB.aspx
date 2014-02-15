<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DnDSaveDB.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.DnDSaveDB" %>
<%@ Register Assembly="Goldtect.ASTreeView" Namespace="Goldtect" TagPrefix="astv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASTreeViewDemo7</title>
    <link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
    <link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
    
    <script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
    <script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>

    <script type="text/javascript">
        //parameter must be "elem", "newParent"
        function dndCompletedHandler(elem, newParent) {
           
            var nodeAdditionalAttr = JSON.parse(elem.getAttribute("additional-attributes"));
            var nodeValue = elem.getAttribute("treeNodeValue");
            console.log("node value:" + nodeValue + " tree name:" +  nodeAdditionalAttr.treeName);

            var parentAdditionalAttr = JSON.parse(newParent.getAttribute("additional-attributes"));
            var parentValue = newParent.getAttribute("treeNodeValue");
            console.log("node value:" + parentValue + " tree name:" + parentAdditionalAttr.treeName);

            document.getElementById("<%=txtNodeValue.ClientID%>").value = nodeValue;
            document.getElementById("<%=txtNodeTreeName.ClientID%>").value = nodeAdditionalAttr.treeName;
            document.getElementById("<%=txtParentValue.ClientID%>").value = parentValue;
            document.getElementById("<%=txtParentTreeName.ClientID%>").value = parentAdditionalAttr.treeName;
       
            document.getElementById("<%=btnSaveDragDrop.ClientID%>").click();
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        
        <h2>Drag & Drop Between Trees & Save to DB</h2>
    <div>
        <asp:ScriptManager ID="sm" runat=server></asp:ScriptManager>
        <asp:UpdatePanel ID="upPanel2" runat="server">
            <ContentTemplate>
            <div style="border:2px solid red;padding:6px;color:red;">
                <h3>You can hide this part by set style="display:none;"</h3>
                <h3>For Demo purpose, cascade situation is not handled. See the code behind</h3>
                <asp:TextBox ID="txtNodeValue" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtNodeTreeName" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtParentValue" runat="server"></asp:TextBox>
                <asp:TextBox ID="txtParentTreeName" runat="server"></asp:TextBox>
                <asp:Button ID="btnSaveDragDrop" runat="server" Text="Save Drag & Drop" OnClick="btnSaveDragDrop_Click" />
            </div>
            <table>
                <tr>
                    <th><h3><asp:Literal ID="aslTreeOne" runat="server" Text="TreeOne"></asp:Literal></h3></th>
                    <th><h3><asp:Literal ID="aslTreeTwo" runat="server" Text="TreeTwo"></asp:Literal></h3></th>
                </tr>
                <tr valign="top">
                    <td width="300">

                        <astv:ASTreeView ID="astvMyTree1" 
                            runat="server"
                            BasePath="~/Scripts/astreeview/"
                            DataTableRootNodeValue="0"
                            EnableRoot="true"
                            RootNodeText="TreeView 1" 
                            EnableNodeSelection="true" 
                            EnableCheckbox="false" 
                            EnableDragDrop="true" 
                            EnableTreeLines="true"
                            EnableNodeIcon="true"
                            EnableCustomizedNodeIcon="false"
                            EnableDebugMode="false"
                            EnableContextMenuAdd="false"
                            RelatedTrees="astvMyTree2" 
                            OnNodeDragAndDropCompletedScript="dndCompletedHandler( elem, newParent )"/>
                    </td>
                    <td>
                        <astv:ASTreeView ID="astvMyTree2" 
                            runat="server"
                            BasePath="~/Scripts/astreeview/"
                            DataTableRootNodeValue="0"
                            EnableRoot="true" 
                            RootNodeText="TreeView 2" 
                            EnableNodeSelection="true" 
                            EnableCheckbox="false" 
                            EnableDragDrop="true" 
                            EnableTreeLines="true"
                            EnableNodeIcon="true"
                            EnableCustomizedNodeIcon="false"
                            EnableDebugMode="false"
                            EnableContextMenuAdd="false"
                            RelatedTrees="astvMyTree1" 
                            OnNodeDragAndDropCompletedScript="dndCompletedHandler( elem, newParent )" />
                    </td>
                </tr>
            </table>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
