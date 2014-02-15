using System;

namespace Goldtect.ASTreeViewDemo
{
	public partial class ASTreeViewDemo13 : System.Web.UI.Page
	{
		protected void Page_Load( object sender, EventArgs e )
		{

		}

		protected override void OnInit( EventArgs e )
		{
			base.OnInit( e );

			this.dscDemoServerControl.OnSelectedNodeChanged += new DemoServerControlNodeSelectedEventHandler( dscDemoServerControl_OnSelectedNodeChanged );
		}

		void dscDemoServerControl_OnSelectedNodeChanged( object src, DemoServerControlNodeSelectedEventArgs e )
		{
			Response.Write( string.Format( "[node text]:{0}<br />[node value]:{1}", e.NodeText, e.NodeValue ) );
		}
	}
}
