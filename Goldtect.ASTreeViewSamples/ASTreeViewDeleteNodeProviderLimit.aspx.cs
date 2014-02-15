#region using

using System;
using System.Data;
using System.Web;
using System.Web.UI;

#endregion


namespace Goldtect.ASTreeViewDemo
{
	public partial class ASTreeViewDeleteNodeProviderLimit : PageBase
	{
		ASTreeViewAjaxReturnCode returnCode;
		string errorMessage = string.Empty;

		const string CUS_RETURN_CODE_OK = "0";
		const string CUS_RETURN_CODE_ERROR = "1";
		string cusReturnCode = "0";
		string cusMessage = "Edit Succeed!";

		public string DeleteNodeValues
		{
			get
			{
				return HttpUtility.UrlDecode( Request.QueryString["deleteNodeValues"] );
			}
		}

		protected void Page_Load( object sender, EventArgs e )
		{
			if( string.IsNullOrEmpty( this.DeleteNodeValues ) || string.IsNullOrEmpty( this.DeleteNodeValues ) )
			{
				returnCode = ASTreeViewAjaxReturnCode.ERROR;
				return;
			}

			try
			{
				if( !IsDeleteValid() )
				{
					this.cusMessage = "[Server Said]:Node (or its children) cannot be deleted with the letter 'a'";
					this.cusReturnCode = CUS_RETURN_CODE_ERROR;
				}
				else
				{
					this.DeleteNodes();
				}
			}
			catch( Exception ex )
			{
				this.returnCode = ASTreeViewAjaxReturnCode.ERROR;
				this.errorMessage = ex.Message;
			}
		}

		private bool IsDeleteValid()
		{
			string sql = string.Format( "Select * FROM [Products] WHERE [ProductID] in ( {0} )", this.DeleteNodeValues );
			DataSet ds = OleDbHelper.ExecuteDataset( base.NorthWindConnectionString
				, CommandType.Text
				, sql );

			foreach( DataRow dr in ds.Tables[0].Rows )
			{
				if( dr["ProductName"].ToString().ToLower().IndexOf( "a" ) >= 0 )
					return false;
			}

			return true;
		}

		protected override void Render( HtmlTextWriter writer )
		{
			if( this.returnCode == ASTreeViewAjaxReturnCode.OK )
				writer.Write( ( (int)this.returnCode ).ToString() + "|" + this.cusReturnCode + "|" + this.cusMessage );
			else
				writer.Write( this.errorMessage );
		}

		protected void DeleteNodes()
		{
			string sql = string.Format( "DELETE FROM [Products] WHERE [ProductID] in ( {0} )", this.DeleteNodeValues );
			OleDbHelper.ExecuteNonQuery( base.NorthWindConnectionString
				, CommandType.Text
				, sql );
		}
	}
}
