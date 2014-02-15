<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ASTreeViewDemoServerControl.aspx.cs" Inherits="Goldtect.ASTreeViewDemo.ASTreeViewDemoServerControl" %>
<%@ Register Assembly="Goldtect.ASTreeViewDemo" Namespace="Goldtect.ASTreeViewDemo" TagPrefix="ct" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Test Server Side Control</title>
    
    <link href="<%=ResolveUrl("~/Scripts/astreeview/astreeview.css")%>" type="text/css" rel="stylesheet" />
	<link href="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.css")%>" type="text/css" rel="stylesheet" />
	<script src="<%=ResolveUrl("~/Scripts/astreeview/astreeview.min.js")%>" type="text/javascript"></script>
	<script src="<%=ResolveUrl("~/Scripts/astreeview/contextmenu.min.js")%>" type="text/javascript"></script>
	
	
</head>
<body>
    <form id="form1" runat="server">
    <div>
		<ct:DemoServerControl ID="dscDemoServerControl" runat="server" />
    </div>
    </form>
</body>
</html>
