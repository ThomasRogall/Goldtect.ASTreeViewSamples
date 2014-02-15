#region using
using System;
using System.Xml;

#endregion

namespace Goldtect.ASTreeViewDemo
{
	public partial class ASTreeViewDemo7 : PageBase
	{
		protected void Page_Load( object sender, EventArgs e )
		{

			if( !IsPostBack )
				GenerateTree();
		}

		private void GenerateTree()
		{

			XmlDocument doc = new XmlDocument();
			string path = Server.MapPath( "~/ASTreeViewDemo4_Sample_Data.xml" );
			doc.Load( path );

			ASTreeViewXMLDescriptor descripter = new ASTreeViewXMLDescriptor();

			this.astvMyTree1.DataSourceDescriptor = descripter;
			this.astvMyTree1.DataSource = doc;
			this.astvMyTree1.DataBind();

			this.astvMyTree2.DataSourceDescriptor = descripter;
			this.astvMyTree2.DataSource = doc;
			this.astvMyTree2.DataBind();

		}

		protected void btnTreeOneToTreeTwo_Click( object sender, EventArgs e )
		{
			this.astvMyTree1.RelatedTrees = "astvMyTree2";
			this.astvMyTree2.RelatedTrees = "";
		}

		protected void btnTreeTwoToTreeOne_Click( object sender, EventArgs e )
		{
			this.astvMyTree2.RelatedTrees = "astvMyTree1";
			this.astvMyTree1.RelatedTrees = "";
		}

		protected void btnEnableBothWays_Click( object sender, EventArgs e )
		{
			this.astvMyTree1.RelatedTrees = "astvMyTree2";
			this.astvMyTree2.RelatedTrees = "astvMyTree1";
		}
	}
}
