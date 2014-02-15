using System;

namespace Goldtect.ASTreeViewDemo
{
	public partial class Header : System.Web.UI.UserControl
	{
		protected string ASTreeViewVersion
		{
			get
			{
				return typeof( ASTreeView ).Assembly.GetName().Version.ToString();
			}
		}

		protected void Page_Load( object sender, EventArgs e )
		{

		}
	}
}