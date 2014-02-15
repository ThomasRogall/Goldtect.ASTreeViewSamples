#region using
using System;
using System.Data;

#endregion

namespace Goldtect.ASTreeViewDemo
{
	public partial class ASTreeViewDemo8 : PageBase
	{
		protected void Page_Load( object sender, EventArgs e )
		{
			if( !IsPostBack )
				GenerateTree();
		}

		private void GenerateTree()
		{
			//bind data from data table
			//string path = System.AppDomain.CurrentDomain.BaseDirectory;
			//string connStr = string.Format( "Provider=Microsoft.Jet.OLEDB.4.0;Data source={0}db\\NorthWind.mdb", path );

			DataSet ds = OleDbHelper.ExecuteDataset( base.NorthWindConnectionString, CommandType.Text, "select * from [Products]" );

			ASTreeViewDataTableColumnDescriptor descripter = new ASTreeViewDataTableColumnDescriptor( "ProductName"
				, "ProductID"
				, "ParentID" );

			this.astvMyTree.DataSourceDescriptor = descripter;
			this.astvMyTree.DataSource = ds.Tables[0];
			this.astvMyTree.DataBind();

		}

		protected override void OnPreRender( EventArgs e )
		{
			base.OnPreRender( e );

		}

		protected void btnExpandToDepth_Click( object sender, EventArgs e )
		{
			int depth = -1;
			try
			{
				depth = int.Parse( this.txtDepth.Text );
			}
			catch { }

			this.astvMyTree.ExpandToDepth( depth );
		}

		protected void btnPostBackTest_Click( object sender, EventArgs e )
		{
			this.btnPostBackTest.Text = "Just a postback test";
		}
		
	}
}
