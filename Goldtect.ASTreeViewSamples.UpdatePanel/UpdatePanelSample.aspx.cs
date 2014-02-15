#region using
using System;
using System.Xml;
using Goldtect;
using Goldtect.Utilities.Xml;

#endregion

namespace Goldtect.ASTreeViewDemo.UpdatePanelDemo
{
	public partial class UpdatePanelSample : System.Web.UI.Page
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

			//if( !IsPostBack )
			//	GenerateTree();
		}

		private void GenerateTree()
		{
			XmlDocument doc = new XmlDocument();
			doc.Load( Server.MapPath( "~/ASTreeViewDemo4_Sample_Data.xml" ) );

			ASTreeViewXMLDescriptor descripter = new ASTreeViewXMLDescriptor();

			this.astvMyTree.DataSourceDescriptor = descripter;
			this.astvMyTree.DataSource = doc;
			this.astvMyTree.DataBind();
		}

		protected void btnGetTreeViewXML_Click( object sender, EventArgs e )
		{
			string toConsole = XmlHelper.GetFormattedXmlString( this.astvMyTree.GetTreeViewXML(), true );
			this.divConsole.InnerHtml += ( string.Format( ">>Treeview XML: <pre style='padding-left:20px;'>{0}</pre>", toConsole.ToString() ) );

			this.astvMyTree.ForceRenderInitialScript();
			upPanel2.Update();
		}

		protected void btnHideOutSide_Click( object sender, EventArgs e )
		{
			this.astvMyTree.Visible = false;
			this.astvMyTree.ForceRenderInitialScript();
			upPanel2.Update();
		}

		protected void btnShowOutSide_Click( object sender, EventArgs e )
		{
			this.astvMyTree.Visible = true;
			this.astvMyTree.ForceRenderInitialScript();
			upPanel2.Update();
		}

		protected void btnGenereateTree_Click( object sender, EventArgs e )
		{
			this.GenerateTree();
			this.astvMyTree.Visible = true;
			this.astvMyTree.ForceRenderInitialScript();
			upPanel2.Update();
		}
		protected void btnShow_Click( object sender, EventArgs e )
		{
			this.astvMyTree.ForceRenderInitialScript();
			this.astvMyTree.Visible = true;
		}

		protected void btnHide_Click( object sender, EventArgs e )
		{
			this.astvMyTree.Visible = false;
		}
	}
}
